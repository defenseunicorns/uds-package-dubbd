provider "aws" {
}

terraform {
  backend "s3" {
  }
}

data "aws_eks_cluster" "existing" {
  name = var.name
}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}

locals {
  generate_kms_key          = var.create_kms_key ? 1 : 0
  kms_key_arn               = var.kms_key_arn == null ? module.generate_kms[0].kms_key_arn : var.kms_key_arn
  oidc_arn                  = "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.oidc_url_without_protocol}"
  oidc_url_without_protocol = substr(data.aws_eks_cluster.existing.identity[0].oidc[0].issuer, 8, -1)
}

module "S3" {
  source                  = "github.com/defenseunicorns/terraform-aws-uds-s3?ref=v0.0.5"
  name_prefix             = var.name
  kms_key_arn             = local.kms_key_arn
  force_destroy           = var.force_destroy
  create_bucket_lifecycle = true
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = module.S3.bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Effect = "Allow"
        Principal = {
          AWS = module.irsa.role_arn
        }
        Resource = [
          module.S3.bucket_arn,
          "${module.S3.bucket_arn}/*"
        ]
      }
    ]
  })
}

module "generate_kms" {
  count  = local.generate_kms_key
  source = "github.com/defenseunicorns/terraform-aws-uds-kms?ref=v0.0.2"

  key_owners = var.key_owner_arns
  # A list of IAM ARNs for those who will have full key permissions (`kms:*`)
  kms_key_alias_name_prefix = "${var.name}-loki-" # Prefix for KMS key alias.
  kms_key_deletion_window   = 7
  # Waiting period for scheduled KMS Key deletion. Can be 7-30 days.
  kms_key_description = "${var.name} DUBBD deployment Loki Key" # Description for the KMS key.
  tags = {
    Deployment = "UDS DUBBD ${var.name}"
  }
}

module "irsa" {
  source                     = "github.com/defenseunicorns/terraform-aws-uds-irsa?ref=v0.0.2"
  name                       = "${var.name}-loki-irsa-role"
  kubernetes_namespace       = "logging"
  kubernetes_service_account = "logging-loki"
  oidc_provider_arn          = local.oidc_arn
  role_policy_arns = tomap({
    "loki" = aws_iam_policy.loki_policy.arn }
  )
}

resource "aws_iam_policy" "loki_policy" {
  name        = "${var.name}-loki-irsa-policy"
  path        = "/"
  description = "IAM policy for Loki to have necessary permissions to use S3 for storing logs."
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource = ["arn:${data.aws_partition.current.partition}:s3:::${module.S3.bucket_name}"]
      },
      {
        Effect   = "Allow"
        Action   = ["s3:*Object"]
        Resource = ["arn:${data.aws_partition.current.partition}:s3:::${module.S3.bucket_name}/*"]
      },
      {
        Effect = "Allow"
        Action = [
          "kms:GenerateDataKey",
          "kms:Decrypt"
        ]
        Resource = ["${local.kms_key_arn}"]
      }
    ]
  })
}
