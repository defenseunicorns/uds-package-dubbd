
provider "aws" {

}

variable "kms_key_deletion_window" {
  description = "Waiting period for scheduled KMS Key deletion. Can be 7-30 days."
  type        = number
  default     = 7
}

variable "kms_key_alias" {

}

output "kms_key_arn" {
  value = aws_kms_key.default.arn
}

output "kms_key_alias" {
  value = aws_kms_alias.default.id
}

resource "random_id" "default" {
  byte_length = 2
}

locals{
    kms_key_alias_name_prefix  = "alias/dubbd-aws-testing-${lower(random_id.default.hex)}"
}

# Create a KMS key and corresponding alias. This KMS key will be used whenever encryption is needed in creating this infrastructure deployment
resource "aws_kms_key" "default" {
  description             = "KMS Key for DUBBD"
  deletion_window_in_days = var.kms_key_deletion_window
  enable_key_rotation     = true
  policy                  = data.aws_iam_policy_document.kms_access.json
  multi_region            = true
}

resource "aws_kms_alias" "default" {
  name_prefix   = local.kms_key_alias_name_prefix
  target_key_id = aws_kms_key.default.key_id

}


data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}


# Create custom policy for KMS
data "aws_iam_policy_document" "kms_access" {
  # checkov:skip=CKV_AWS_111: todo reduce perms on key
  # checkov:skip=CKV_AWS_109: todo be more specific with resources
  statement {
    sid = "KMS Key Default"
    principals {
      type = "AWS"
      identifiers = [
        "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }

    actions = [
      "kms:*",
    ]

    resources = ["*"]
  }
  statement {
    sid = "CloudWatchLogsEncryption"
    principals {
      type        = "Service"
      identifiers = ["logs.${data.aws_region.current.name}.amazonaws.com"]
    }
    actions = [
      "kms:Encrypt*",
      "kms:Decrypt*",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:Describe*",
    ]

    resources = ["*"]
  }
  statement {
    sid = "Cloudtrail KMS permissions"
    principals {
      type = "Service"
      identifiers = [
        "cloudtrail.amazonaws.com"
      ]
    }
    actions = [
      "kms:Encrypt*",
      "kms:Decrypt*",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:Describe*",
    ]
    resources = ["*"]
  }

}

