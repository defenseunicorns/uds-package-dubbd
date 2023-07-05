provider "aws" {
}

terraform {
  backend "s3" {
  }
}

data "aws_eks_cluster" "existing" {
  name = var.name
}

module "iam_assumable_role_admin" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "5.27.0"
  create_role                   = true
  role_name                     = "external-dns-${var.name}"
  provider_url                  = substr(data.aws_eks_cluster.existing.identity[0].oidc[0].issuer, 8, -1)
  role_policy_arns              = [length(aws_iam_policy.external_dns) >= 1 ? aws_iam_policy.external_dns.arn : ""]
  oidc_fully_qualified_subjects = ["system:serviceaccount:external-dns:external-dns"]
}

resource "aws_iam_policy" "external_dns" {
  name        = "AllowExternalDNSUpdates"
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
        "arn:aws:route53:::hostedzone/*"
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
        "*"
      ]
    }
  ]
})
}
