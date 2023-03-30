
provider "aws" {

}

module "S3" {
    source = "github.com/defenseunicorns/iac//modules/s3-irsa"
    name_prefix = "${var.name}"
    eks_oidc_provider_arn = "${var.eks_oidc_provider_arn}"
    kms_key_alias = "${var.name}"
    kubernetes_service_account = "logging-loki"
    kubernetes_namespace = "logging"
    dynamodb_enabled = "false"
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

variable "name" {
    description = "Name for cluster"
}

variable "eks_oidc_provider_arn" {

}
