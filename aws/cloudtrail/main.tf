provider "aws" {

}

terraform {
  backend "s3" {
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

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

resource "aws_kms_key" "default" {
  description             = "SSM Key"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  policy                  = data.aws_iam_policy_document.kms_access.json
  multi_region            = true
}

resource "aws_kms_alias" "default" {
  name_prefix   = "alias/${var.name}"
  target_key_id = aws_kms_key.default.key_id
}

module "cloudtrail" {
  source = "github.com/defenseunicorns/terraform-aws-uds-cloudtrail?ref=v0.0.1-alpha"
  name                   = var.name
  kms_key_id             = aws_kms_key.default.id
  use_external_s3_bucket = var.use_external_s3_bucket
  s3_bucket_name         = var.s3_bucket_name
  tags = {
    Deployment = "UDS Cloudtrail ${var.name}"
  }

  depends_on = [
    aws_kms_key.default,
    aws_kms_alias.default
  ]
}