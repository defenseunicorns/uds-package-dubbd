provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
  }
}

# taken from zarf bb repo
resource "random_id" "default" {
  byte_length = 2
}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

locals {
  oidc_arn = var.create_cluster ? module.cluster[0].oidc_provider_arn : var.oidc_provider_arn

  generate_kms_key = var.create_kms_key ? 1 : 0
  kms_key_arn      = var.kms_key_arn == null ? module.generate_kms[0].kms_key_arn : var.kms_key_arn
  # The conditional may need to look like this depending on how we decide to handle the way varf wants to template things
  # generate_kms_key          = var.kms_key_arn == "" ? 1 : 0
  # kms_key_arn               = var.kms_key_arn == "" ? module.generate_kms[0].kms_key_arn : var.kms_key_arn

  vpc_id                      = var.create_vpc ? module.vpc.vpc_id : var.vpc_id
  private_subnets_cidr_blocks = var.create_vpc ? module.vpc[0].private_subnets_cidr_blocks : var.private_subnets_cidr_blocks
  private_subnets             = var.create_vpc ? module.vpc[0].private_subnets : var.private_subnets
  public_subnets              = var.create_vpc ? module.vpc[0].public_subnets : var.public_subnets
}

###### S3 ######

module "S3" {
  source                     = "github.com/defenseunicorns/terraform-aws-uds-s3?ref=v0.0.1"
  name_prefix                = var.name_prefix
  eks_oidc_provider_arn      = local.oidc_arn
  kubernetes_service_account = "logging-loki"
  kubernetes_namespace       = "logging"
  kms_key_arn                = local.kms_key_arn
  force_destroy              = var.force_destroy

}

module "generate_kms" {
  count  = local.generate_kms_key
  source = "github.com/defenseunicorns/terraform-aws-uds-kms?ref=v0.0.1"

  key_owners                = var.key_owner_arns                             # A list of IAM ARNs for those who will have full key permissions (`kms:*`)
  kms_key_alias_name_prefix = "${var.name_prefix}-loki-"                     # Prefix for KMS key alias.
  kms_key_deletion_window   = 7                                              # Waiting period for scheduled KMS Key deletion. Can be 7-30 days.
  kms_key_description       = "${var.name_prefix} DUBBD deployment Loki Key" # Description for the KMS key.
  tags = {
    Deployment = "UDS DUBBD ${var.name_prefix}"
  }
}

###### VPC ######

module "vpc" {
  count  = var.create_vpc ? 1 : 0
  source = "github.com/defenseunicorns/terraform-aws-uds-vpc?ref=v0.0.1-alpha"

  name                         = "${var.name_prefix}-${lower(random_id.default.hex)}"
  vpc_cidr                     = var.vpc_cidr
  #secondary_cidr_blocks = var.secondary_cidr_blocks
  azs                          = slice(data.aws_availability_zones.available, 0, 3)
  public_subnets               = [for k, v in module.vpc[0].azs : cidrsubnet(module.vpc[0].vpc_cidr_block, 5, k)]
  private_subnets              = [for k, v in module.vpc[0].azs : cidrsubnet(module.vpc[0].vpc_cidr_block, 5, k + 4)]
  #database_subnets      = [for k, v in module.vpc.azs : cidrsubnet(module.vpc.vpc_cidr_block, 5, k + 8)]
  #intra_subnets         = [for k, v in module.vpc.azs : cidrsubnet(element(module.vpc.vpc_secondary_cidr_blocks, 0), 5, k)]
  single_nat_gateway           = true
  enable_nat_gateway           = true
  create_database_subnet_group = false
}

###### EKS ######

module "cluster" {
  count  = var.create_cluster ? 1 : 0
  source = "github.com/defenseunicorns/terraform-aws-uds-eks"

  name                            = "${var.name_prefix}-${lower(random_id.default.hex)}"
  aws_region                      = data.aws_region.current.name
  vpc_id                          = local.vpc_id #module.vpc[0].vpc_id
  cidr_blocks                     = local.private_subnets_cidr_blocks #module.vpc[0].private_subnets_cidr_blocks
  private_subnet_ids              = local.private_subnets #module.vpc[0].private_subnets
  control_plane_subnet_ids        = local.private_subnets #module.vpc[0].private_subnets
  #source_security_group_id        = module.bastion.security_group_ids[0]
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access

  # If using EKS Managed Node Groups, the aws-auth ConfigMap is created by eks itself and terraform can not create it
  create_aws_auth_configmap = var.create_aws_auth_configmap
  manage_aws_auth_configmap = var.manage_aws_auth_configmap

  ####### EKS Managed Node Group ######
  eks_managed_node_group_defaults = {}

  eks_managed_node_groups = {}

  ###### Self Managed Node Group ######
  self_managed_node_group_defaults = {} #local.self_managed_node_group_defaults
  self_managed_node_groups         = {} #local.self_managed_node_groups

  #---------------------------------------------------------------
  #"native" EKS Add-Ons
  #---------------------------------------------------------------

	cluster_addons = {
		coredns = { # including this for now because it's an easy way to increate the timeout needed for EBS CSI Driver
			preserve    = true
			most_recent = true

			timeouts = {
				create = "25m"
				delete = "10m"
			}
		}
	}

  #---------------------------------------------------------------
  # EKS Blueprints - EKS Add-Ons
  #---------------------------------------------------------------

  # AWS EKS EBS CSI Driver
  enable_amazon_eks_aws_ebs_csi_driver = true #var.enable_amazon_eks_aws_ebs_csi_driver
  amazon_eks_aws_ebs_csi_driver_config = { #var.amazon_eks_aws_ebs_csi_driver_config
    wait        = false
    most_recent = true
  }
}

module "eks_managed_node_group" {
  count  = var.create_cluster ? 1 : 0
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"

  ami_type = "AL2_x86_64"
  cluster_name = module.cluster[0].cluster_name
  desired_size = 3
  disk_size = 150
  instance_types = ["m5.2xlarge"]
  name = "${var.name_prefix}-ng-1"
  #subnet_ids = [for k, v in module.vpc[0].azs : cidrsubnet(module.vpc[0].vpc_cidr_block, 5, k)]
  subnet_ids = local.public_subnets
  use_custom_launch_template = false
}
