provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
  }
}

module "rke2" {
  source  = "github.com/rancherfederal/rke2-aws-tf?ref=v2.4.0"
  cluster_name    = var.name
  vpc_id  = var.vpc_id
  subnets = var.subnets
  ami     = var.ami
  servers       = 3
  instance_type = "m5.2xlarge"
  tags = {
    name = var.name
  }
  block_device_mappings = {
    size = 100
    encrypted = true
    type = "gp3"
  }
  enable_ccm = true
  iam_permissions_boundary = var.iam_permissions_boundary
  download = false
  rke2_config = <<-EOF
disable:
  - rke2-ingress-nginx
  - rke2-metrics-server
EOF
  controlplane_internal = var.controlplane_internal
  associate_public_ip_address = var.associate_public_ip_address
  wait_for_capacity_timeout = "20m"
}

resource "null_resource" "kubeconfig" {
  depends_on = [module.rke2]

  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "aws s3 cp ${module.rke2.kubeconfig_path} ~/.kube/config"
  }
}
