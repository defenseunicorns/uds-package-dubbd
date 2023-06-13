terraform {
  backend "local" {
  }
}

data "aws_eks_cluster" "existing" {
  count = 0
}

locals {
  oidc_url_without_protocol = ""
  oidc_arn = ""
}