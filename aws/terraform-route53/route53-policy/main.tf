provider "aws" {
}

terraform {
#  backend "s3" {
#  }
}

data "aws_eks_cluster" "existing" {
  name = var.name
}

data "aws_partition" "current" {}

# using du irsa module
module "irsa" {
  source = "github.com/defenseunicorns/terraform-aws-uds-irsa?ref=v0.0.1"

  name = "external-dns-role-${var.name}"

  policy_arns = [
   length(aws_iam_policy.external_dns) >= 1 ? aws_iam_policy.external_dns.arn : ""
  ]

  provider_url = substr(data.aws_eks_cluster.existing.identity[0].oidc[0].issuer, 8, -1)

  oidc_fully_qualified_subjects = ["system:serviceaccount:external-dns:external-dns"]
}

resource "aws_iam_policy" "external_dns" {
  name        = "external-dns-policy-${var.name}"
  path        = "/"
  description = "Policy for external-dns to create records in route53 hosted zones. Created by DUBBD."

  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(
{
  Version = "2012-10-17",
  Statement = [
    {
      Effect = "Allow",
      Action = [
        "route53:ChangeResourceRecordSets"
      ]
      Resource = [
        "arn:${data.aws_partition.current.partition}:route53:::hostedzone/*"
      ]
    },
    {
      Effect = "Allow"
      Action = [
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets",
        "route53:ListTagsForResource"
      ]
      Resource = [
        "*" # TODO: A tiny bit more specific on resources
      ]
    }
  ]
})
}
