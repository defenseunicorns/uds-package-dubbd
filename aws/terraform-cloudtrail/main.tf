provider "aws" {

}

terraform {
  backend "s3" {
  }
}

locals {
  name = substr(var.name,0,13) // Shorten name due to length constraints on IAM role
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

module "generate_kms" {
  source = "github.com/defenseunicorns/terraform-aws-uds-kms?ref=v0.0.2"

  key_owners                = var.key_owner_arns # A list of IAM ARNs for those who will have full key permissions (`kms:*`)
  kms_key_alias_name_prefix = "${local.name}-cloudtrail-" # Prefix for KMS key alias.
  kms_key_deletion_window   = 7 # Waiting period for scheduled KMS Key deletion. Can be 7-30 days.
  kms_key_description       = "${local.name} UDS Cloudtrail Key" # Description for the KMS key.
  tags                      = {
    Deployment = "UDS Cloudtrail ${local.name}"
  }
}

module "cloudtrail" {
  source = "github.com/defenseunicorns/terraform-aws-uds-cloudtrail?ref=v0.0.1-alpha"
  name                   = local.name
  kms_key_id             = module.generate_kms.kms_key_alias
  use_external_s3_bucket = var.use_external_s3_bucket
  s3_bucket_name         = var.s3_bucket_name
  tags = {
    Deployment = "UDS Cloudtrail ${local.name}"
  }

  depends_on = [
    module.generate_kms
  ]
}