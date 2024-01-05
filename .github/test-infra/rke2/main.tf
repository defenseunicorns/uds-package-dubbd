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
      version = "3.2.2"
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
echo "Adding AWS cloud provider manifest."
mkdir -p /var/lib/rancher/rke2/server/manifests

cat > /var/lib/rancher/rke2/server/manifests/00-aws-ccm.yaml << EOM
apiVersion: helm.cattle.io/v1
kind: HelmChart
metadata:
  name: aws-cloud-controller-manager
  namespace: kube-system
spec:
  chart: aws-cloud-controller-manager
  repo: https://kubernetes.github.io/cloud-provider-aws
  version: 0.0.8
  targetNamespace: kube-system
  bootstrap: true
  valuesContent: |-
    nodeSelector:
      node-role.kubernetes.io/control-plane: "true"
    hostNetworking: true
    args:
      - --configure-cloud-routes=false
      - --v=2
      - --cloud-provider=aws
EOM

cat > /var/lib/rancher/rke2/server/manifests/01-aws-ebs.yaml << EOM
apiVersion: helm.cattle.io/v1
kind: HelmChart
metadata:
  name: aws-ebs-csi-driver
  namespace: kube-system
spec:
  chart: aws-ebs-csi-driver
  repo: https://kubernetes-sigs.github.io/aws-ebs-csi-driver
  version: 2.25.0
  targetNamespace: kube-system
  valuesContent: |-
    storageClasses:
      - name: default
        annotations:
          storageclass.kubernetes.io/is-default-class: "true"
        allowVolumeExpansion: true
        provisioner: kubernetes.io/aws-ebs
        volumeBindingMode: WaitForFirstConsumer
        parameters:
          type: gp3
        reclaimPolicy: Retain
EOM

echo "Installing awscli"
yum install -y unzip
yum install -y curl
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
EOF

  post_userdata = <<-EOF
# This needs to match https://github.com/defenseunicorns/uds-rke2-image-builder/blob/main/packer/scripts/rke2-startup.sh#L53
echo "Fixing RKE2 file permissions for STIG"
dir=/etc/rancher/rke2
chmod -R 0600 $dir/*
chown -R root:root $dir/*

dir=/var/lib/rancher/rke2
chown root:root $dir/*

dir=/var/lib/rancher/rke2/agent
chown root:root $dir/*
chmod 0700 $dir/pod-manifests
chmod 0700 $dir/etc
find $dir -maxdepth 1 -type f -name "*.kubeconfig" -exec chmod 0640 {} \;
find $dir -maxdepth 1 -type f -name "*.crt" -exec chmod 0600 {} \;
find $dir -maxdepth 1 -type f -name "*.key" -exec chmod 0600 {} \;

dir=/var/lib/rancher/rke2/bin
chown root:root $dir/*
chmod 0750 $dir/*

dir=/var/lib/rancher/rke2/data
chown root:root $dir
chmod 0750 $dir
chown root:root $dir/*
chmod 0640 $dir/*

dir=/var/lib/rancher/rke2/server
chown root:root $dir/*
chmod 0700 $dir/cred
chmod 0700 $dir/db
chmod 0700 $dir/tls
chmod 0751 $dir/manifests
chmod 0750 $dir/logs
chmod 0600 $dir/token
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
  ccm_external                = true
  iam_permissions_boundary    = local.iam_permissions_boundary
  download                    = false
  controlplane_internal       = var.controlplane_internal
  associate_public_ip_address = var.associate_public_ip_address
  wait_for_capacity_timeout   = "20m"

  pre_userdata  = local.pre_userdata
  post_userdata = local.post_userdata
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
  ccm_external              = true
  iam_permissions_boundary  = local.iam_permissions_boundary
  download                  = false
  wait_for_capacity_timeout = "20m"
  # Required data for identifying cluster to join
  cluster_data = module.rke2.cluster_data

  pre_userdata  = local.pre_userdata
  post_userdata = local.post_userdata
}

resource "null_resource" "kubeconfig" {
  depends_on = [module.rke2]

  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "aws s3 cp ${module.rke2.kubeconfig_path} ~/.kube/config"
  }
}
