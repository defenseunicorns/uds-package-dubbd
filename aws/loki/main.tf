
provider "aws" {

}

variable "name" {
    description = "Name for cluster"
}

data "aws_eks_cluster" "existing" {
  name = var.name
}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

locals {
  oidc_url_without_protocol = substr(data.aws_eks_cluster.existing.identity[0].oidc[0].issuer, 8, -1) # removes "https://"
  oidc_arn                  = "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.oidc_url_without_protocol}"
}

output "eks_oidc_arn"{
    value = local.oidc_arn
}

module "S3" {
    source = "github.com/defenseunicorns/delivery-aws-iac//modules/s3-irsa"
    name_prefix = "${var.name}"
    eks_oidc_provider_arn = local.oidc_arn
    kubernetes_service_account = "logging-loki"
    kubernetes_namespace = "logging"
    dynamodb_enabled = "false"
    kms_key_arn = "${var.kms_key_arn}"
    force_destroy = "${var.force_destroy}"
}

data "aws_region" "current" {}

output "aws_region" {
  value = data.aws_region.current.name
}

output "irsa_role" {
  value = module.S3.irsa_role
}

output "s3" {
  value = module.S3
}

output "s3_bucket" {
  value =  module.S3.s3_bucket
}

output "dynamodb_name" {
  value =  module.S3.dynamodb_name
}

output "eks_cluster_oidc_arn" {
  description = "The ARN of the OIDC Provider of the EKS Cluster"
  value       = local.oidc_arn
}

variable "kms_key_arn" {

}

variable "key_alias" {
  description = "alias for KMS Key"
  default = "bigbang-loki"
}

variable "force_destroy" {
  description = "Option to set force destroy"
  type        = bool
  default     = false
}
