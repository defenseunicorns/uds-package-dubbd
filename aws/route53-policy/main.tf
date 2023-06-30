provider "aws" {
}

terraform {
  backend "s3" {
  }
}

resource "aws_iam_policy" "route53_role" {
  name        = "AllowExternalDNSUpdates"
  path        = "/"
  description = "Policy for external-dns to create records in route53 hosted zones. Created by DUBBD."

  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets"
      ],
      "Resource": [
        "arn:aws:route53:::hostedzone/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets",
        "route53:ListTagsForResource"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
})
}

#TODO: use the aws public modules to configure iam and irsa, see example below
# https://github.com/defenseunicorns/terraform-aws-uds-s3/blob/1c098dc739e096c0425a23ba6bdf3c84feb37e18/main.tf#L106