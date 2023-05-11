
provider "aws" {

}

# taken from zarf bb repo
resource "random_id" "default" {
  byte_length = 2
}

# taken from zarf bb repo
locals{
    kms_key_alias_name_prefix  = "alias/dubbd-aws-testing-${lower(random_id.default.hex)}"
}

# taken from zarf bb repo
variable "kms_key_deletion_window" {
  description = "Waiting period for scheduled KMS Key deletion. Can be 7-30 days."
  type        = number
  default     = 7
}

module "kms_key" {
  source = "github.com/defenseunicorns/uds-iac-aws-kms"
  kms_key_description = "KMS Key for DUBBD"
  kms_key_deletion_window = var.kms_key_deletion_window
  kms_key_alias_name_prefix = local.kms_key_alias_name_prefix
}

module "S3" {
  source = "github.com/defenseunicorns/uds-iac-aws-s3"
  name_prefix = "${var.name}"
  eks_oidc_provider_arn = "${var.eks_oidc_provider_arn}"
  kubernetes_service_account = "logging-loki"
  kubernetes_namespace = "logging"
  #dynamodb_enabled = "false"
  kms_key_arn = "${module.kms_key.kms_key_arn}"
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

#output "dynamodb_name" {
  #value =  module.S3.dynamodb_name
#}

variable "name" {
    description = "Name for cluster"
}

variable "eks_oidc_provider_arn" {

}

variable "force_destroy" {
  description = "Option to set force destroy"
  type        = bool
  default     = false
}
