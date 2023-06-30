provider "aws" {
}

terraform {
  backend "s3" {
  }
}

data "aws_region" "current" {}

locals {
  generate_kms_key = var.create_kms_key ? 1 : 0
  kms_key_arn      = var.kms_key_arn == null ? module.generate_kms[0].kms_key_arn : var.kms_key_arn
  # The conditional may need to look like this depending on how we decide to handle the way varf wants to template things
  # generate_kms_key          = var.kms_key_arn == "" ? 1 : 0
  # kms_key_arn               = var.kms_key_arn == "" ? module.generate_kms[0].kms_key_arn : var.kms_key_arn
}

module "S3" {
  source                = "github.com/defenseunicorns/terraform-aws-uds-s3?ref=v0.0.2"
  name_prefix           = var.name
  eks_oidc_provider_arn = null
  kms_key_arn           = local.kms_key_arn
  force_destroy         = var.force_destroy
  create_irsa           = false
}

module "generate_kms" {
  count  = local.generate_kms_key
  source = "github.com/defenseunicorns/terraform-aws-uds-kms?ref=v0.0.1"

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
