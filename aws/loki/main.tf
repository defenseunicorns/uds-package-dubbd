
provider "aws" {

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
}

module "S3" {
  source                     = "github.com/defenseunicorns/delivery-aws-iac//modules/s3-irsa?ref=v0.0.4-alpha"
  name_prefix                = var.name
  eks_oidc_provider_arn      = local.oidc_arn
  kubernetes_service_account = "logging-loki"
  kubernetes_namespace       = "logging"
  dynamodb_enabled           = "false"
  kms_key_arn                = var.kms_key_arn
  force_destroy              = var.force_destroy
}

