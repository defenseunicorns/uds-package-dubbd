provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
  }
}

data "aws_region" "current" {}

locals {
  # These VPC locals will soon be based on the VPC module like:
  # vpc_id = var.create_vpc ? module.vpc.vpc_id : var.vpc_id
  vpc_id          = var.vpc_id
  private_subnets = split(",", var.private_subnets)
  public_subnets  = split(",", var.public_subnets)
}

resource "random_id" "default" {
  byte_length = 2
}

###### EKS ######

module "cluster" {
  source = "github.com/defenseunicorns/terraform-aws-uds-eks"

  name                            = "${var.name_prefix}"  #-${lower(random_id.default.hex)}"
  aws_region                      = data.aws_region.current.name
  vpc_id                          = local.vpc_id
  private_subnet_ids              = local.private_subnets
  control_plane_subnet_ids        = local.private_subnets
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

  # todo: refactor EKS module so we can remove this (ie. add a default)
  cidr_blocks = []

  #---------------------------------------------------------------
  #"native" EKS Add-Ons
  #---------------------------------------------------------------

  cluster_addons = {
    coredns = {
      # including this for now because it's an easy way to increate the timeout needed for EBS CSI Driver
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
  amazon_eks_aws_ebs_csi_driver_config = {
    #var.amazon_eks_aws_ebs_csi_driver_config
    wait        = false
    most_recent = true
  }
}

module "eks_managed_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"

  ami_type                   = "AL2_x86_64"
  cluster_name               = module.cluster.cluster_name
  desired_size               = 3
  disk_size                  = 150
  instance_types             = ["m5.2xlarge"]
  name                       = "${var.name_prefix}-ng-1"
  #subnet_ids = [for k, v in module.vpc[0].azs : cidrsubnet(module.vpc[0].vpc_cidr_block, 5, k)]
  subnet_ids                 = local.public_subnets
  use_custom_launch_template = false
  iam_role_use_name_prefix   = false
}
