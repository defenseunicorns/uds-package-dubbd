provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
  }
}

# taken from zarf bb repo
resource "random_id" "default" {
  byte_length = 2
}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}

locals {
  #oidc_arn = var.create_cluster ? module.cluster[0].oidc_provider_arn : var.oidc_provider_arn

  generate_kms_key = var.create_kms_key ? 1 : 0
  kms_key_arn      = var.kms_key_arn == null ? module.generate_kms[0].kms_key_arn : var.kms_key_arn
  # The conditional may need to look like this depending on how we decide to handle the way varf wants to template things
  # generate_kms_key          = var.kms_key_arn == "" ? 1 : 0
  # kms_key_arn               = var.kms_key_arn == "" ? module.generate_kms[0].kms_key_arn : var.kms_key_arn

}

###### S3 ######

module "S3" {
  source                     = "github.com/defenseunicorns/terraform-aws-uds-s3?ref=v0.0.1"
  name_prefix                = var.name_prefix
  eks_oidc_provider_arn      = var.oidc_provider_arn #local.oidc_arn
  kubernetes_service_account = "logging-loki"
  kubernetes_namespace       = "logging"
  kms_key_arn                = local.kms_key_arn
  force_destroy              = var.force_destroy
}

module "generate_kms" {
  count  = local.generate_kms_key
  source = "github.com/defenseunicorns/terraform-aws-uds-kms?ref=v0.0.1"

  key_owners                = var.key_owner_arns                             # A list of IAM ARNs for those who will have full key permissions (`kms:*`)
  kms_key_alias_name_prefix = "${var.name_prefix}-loki-"                     # Prefix for KMS key alias.
  kms_key_deletion_window   = 7                                              # Waiting period for scheduled KMS Key deletion. Can be 7-30 days.
  kms_key_description       = "${var.name_prefix} DUBBD deployment Loki Key" # Description for the KMS key.
  tags = {
    Deployment = "UDS DUBBD ${var.name_prefix}"
  }
}
