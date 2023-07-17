provider "aws" {
}

terraform {
  backend "s3" {
  }
}

# taken from zarf bb repo
resource "random_id" "default" {
  byte_length = 2
}

data "aws_eks_cluster" "existing" {
  name = var.name
}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}

locals {
  oidc_url_without_protocol = substr(data.aws_eks_cluster.existing.identity[0].oidc[0].issuer, 8, -1)

  generate_kms_key = var.create_kms_key ? 1 : 0
  kms_key_arn      = var.kms_key_arn == null ? module.generate_kms[0].kms_key_arn : var.kms_key_arn
  # The conditional may need to look like this depending on how we decide to handle the way varf wants to template things
  # generate_kms_key          = var.kms_key_arn == "" ? 1 : 0
  # kms_key_arn               = var.kms_key_arn == "" ? module.generate_kms[0].kms_key_arn : var.kms_key_arn
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
  source = "github.com/defenseunicorns/terraform-aws-uds-kms?ref=v0.0.1"

  key_owners = var.key_owner_arns
  # A list of IAM ARNs for those who will have full key permissions (`kms:*`)
  kms_key_alias_name_prefix = "${var.name}-velero-" # Prefix for KMS key alias.
  kms_key_deletion_window   = 7
  # Waiting period for scheduled KMS Key deletion. Can be 7-30 days.
  kms_key_description = "${var.name} DUBBD deployment Velero Key" # Description for the KMS key.
  tags = {
    Deployment = "UDS DUBBD ${var.name}"
  }
}

module "irsa" {
  source                        = "github.com/defenseunicorns/terraform-aws-uds-irsa?ref=v0.0.1"
  name                          = var.name
  provider_url                  = local.oidc_url_without_protocol
  oidc_fully_qualified_subjects = ["system:serviceaccount:velero:velero-velero-server"]
  policy_arns                   = [aws_iam_policy.velero_policy.arn]
}


resource "random_id" "unique_id" {
  byte_length = 4
}

resource "aws_iam_policy" "velero_policy" {
  name        = "VeleroPolicy-${random_id.unique_id.hex}"
  path        = "/"
  description = "Policy to give Velero necessary permissions for cluster backups."

  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow",
          Action = [
            "ec2:DescribeVolumes",
            "ec2:DescribeSnapshots",
            "ec2:CreateTags",
            "ec2:CreateVolume",
            "ec2:CreateSnapshot",
            "ec2:DeleteSnapshot"
          ]
          Resource = [
            "*"
          ]
        },
        {
          Effect = "Allow"
          Action = [
            "s3:GetObject",
            "s3:DeleteObject",
            "s3:PutObject",
            "s3:AbortMultipartUpload",
            "s3:ListMultipartUploadParts"
          ]
          Resource = [
            "arn:${data.aws_partition.current.partition}:s3:::${var.bucket_name}/*"
          ]
        },
        {
          Effect = "Allow",
          Action = [
            "s3:ListBucket"
          ],
          Resource = [
            "arn:${data.aws_partition.current.partition}:s3:::${var.bucket_name}/*"
          ]
        }
      ]
  })
}

