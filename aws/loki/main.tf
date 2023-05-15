
provider "aws" {

}

# taken from zarf bb repo
resource "random_id" "default" {
  byte_length = 2
}

# taken from zarf bb repo
variable "kms_key_deletion_window" {
  description = "Waiting period for scheduled KMS Key deletion. Can be 7-30 days."
  type        = number
  default     = 7
}

variable "create_kms_key" {
  description = "Whether to create a new KMS key to be used with the S3 bucket.  If not, you must pass in your own key ARN."
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "User-provided KMS key in the case this will not create one for you."
  type        = string
  default     = null
}


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

locals {
  kms_key_alias_name_prefix  = "alias/dubbd-aws-${lower(random_id.default.hex)}"
}

module "kms_key" {
  count = var.create_kms_key ? 1 : 0

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
  kms_key_arn = var.create_kms_key ? "${module.kms_key[0].kms_key_arn}" : var.kms_key_arn
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
