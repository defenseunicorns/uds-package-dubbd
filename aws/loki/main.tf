provider "aws" {

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
  oidc_url_without_protocol = substr(data.aws_eks_cluster.existing.identity[0].oidc[0].issuer, 8, -1) # removes "https://"
  oidc_arn                  = "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.oidc_url_without_protocol}"
  generate_kms_key          = var.create_kms_key == true ? 0 : 1
  kms_key_arn               = var.kms_key_arn == null ? module.generate_kms[0].kms_key_arn : var.kms_key_arn
  # The conditional may need to look like this depending on how we decide to handle the way varf wants to template things
  # generate_kms_key          = var.kms_key_arn == "" ? 1 : 0
  # kms_key_arn               = var.kms_key_arn == "" ? module.generate_kms[0].kms_key_arn : var.kms_key_arn
}

module "S3" {
  source                     = "github.com/defenseunicorns/delivery-aws-iac//modules/s3-irsa?ref=v0.0.4-alpha"
  name_prefix                = var.name
  eks_oidc_provider_arn      = local.oidc_arn
  kubernetes_service_account = "logging-loki"
  kubernetes_namespace       = "logging"
  dynamodb_enabled           = "false"
  kms_key_arn                = local.kms_key_arn
  force_destroy              = var.force_destroy

}

module "generate_kms" {
  count  = local.create_kms_key
  source = "github.com/defenseunicorns/uds-iac-aws-kms?ref=dubbd-test"

  key_owners                = var.key_owner_arns                      # A list of IAM ARNs for those who will have full key permissions (`kms:*`)
  kms_key_alias_name_prefix = "${var.name}-loki-"                     # Prefix for KMS key alias.
  kms_key_deletion_window   = 7                                       # Waiting period for scheduled KMS Key deletion. Can be 7-30 days.
  kms_key_description       = "${var.name} DUBBD deployment Loki Key" # Description for the KMS key.
  tags = {
    Deployment = "UDS DUBBD ${var.name}"
  }

}



