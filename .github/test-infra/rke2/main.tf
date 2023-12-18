provider "aws" {
  region = var.region

  default_tags {
    tags = {
      PermissionsBoundary = var.permissions_boundary_name
    }
  }
}

terraform {
  required_version = "1.5.7"
  backend "s3" {
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0, != 5.17.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "tag:Name"
    values = ["*public*"]
  }
}

locals {
  iam_permissions_boundary = var.permissions_boundary_name == null ? null : "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:policy/${var.permissions_boundary_name}"
  pre_userdata             = <<-EOF
    echo "Installing awscli"
    apt-get install -y unzip
    apt-get install -y curl
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
	EOF
}

module "rke2" {
  source        = "github.com/rancherfederal/rke2-aws-tf?ref=v2.4.0"
  cluster_name  = var.name
  vpc_id        = var.vpc_id
  subnets       = data.aws_subnets.public_subnets.ids
  ami           = var.ami
  servers       = 1
  instance_type = "m5.2xlarge"
  tags = {
    name = var.name
  }
  block_device_mappings = {
    size      = 100
    encrypted = true
    type      = "gp3"
  }
  enable_ccm                  = true
  iam_permissions_boundary    = local.iam_permissions_boundary
  download                    = false
  rke2_config                 = <<-EOF
disable:
  - rke2-ingress-nginx
  - rke2-metrics-server
EOF
  controlplane_internal       = var.controlplane_internal
  associate_public_ip_address = var.associate_public_ip_address
  wait_for_capacity_timeout   = "20m"

  pre_userdata = local.pre_userdata
}

module "agents" {
  source = "github.com/rancherfederal/rke2-aws-tf//modules/agent-nodepool?ref=v2.4.0"

  name          = "agent"
  vpc_id        = var.vpc_id
  subnets       = data.aws_subnets.private_subnets.ids
  ami           = var.ami
  asg           = { min : 2, max : 2, desired : 2, termination_policies : ["Default"] }
  spot          = false
  instance_type = "m5.2xlarge"
  tags = {
    name = var.name
  }
  block_device_mappings = {
    size      = 100
    encrypted = true
    type      = "gp3"
  }
  enable_ccm                = true
  iam_permissions_boundary  = local.iam_permissions_boundary
  download                  = false
  rke2_config               = <<-EOF
disable:
  - rke2-ingress-nginx
  - rke2-metrics-server
EOF
  wait_for_capacity_timeout = "20m"
  # Required data for identifying cluster to join
  cluster_data = module.rke2.cluster_data

  pre_userdata = local.pre_userdata
}

resource "null_resource" "kubeconfig" {
  depends_on = [module.rke2]

  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "aws s3 cp ${module.rke2.kubeconfig_path} ~/.kube/config"
  }
}
