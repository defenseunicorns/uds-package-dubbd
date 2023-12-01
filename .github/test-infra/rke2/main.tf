provider "aws" {
  region = var.region
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

module "rke2" {
  source        = "github.com/rancherfederal/rke2-aws-tf?ref=v2.4.0"
  cluster_name  = var.name
  vpc_id        = var.vpc_id
  subnets       = var.public_subnets
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
  iam_permissions_boundary    = var.iam_permissions_boundary
  download                    = false
  rke2_config                 = <<-EOF
disable:
  - rke2-ingress-nginx
  - rke2-metrics-server
EOF
  controlplane_internal       = var.controlplane_internal
  associate_public_ip_address = var.associate_public_ip_address
  wait_for_capacity_timeout   = "20m"
}

module "agents" {
  source = "github.com/rancherfederal/rke2-aws-tf//modules/agent-nodepool?ref=v2.4.0"

  name          = "agent"
  vpc_id        = var.vpc_id
  subnets       = var.private_subnets
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
  iam_permissions_boundary  = var.iam_permissions_boundary
  download                  = false
  rke2_config               = <<-EOF
disable:
  - rke2-ingress-nginx
  - rke2-metrics-server
EOF
  wait_for_capacity_timeout = "20m"
  # Required data for identifying cluster to join
  cluster_data = module.rke2.cluster_data
}

resource "null_resource" "kubeconfig" {
  depends_on = [module.rke2]

  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "aws s3 cp ${module.rke2.kubeconfig_path} ~/.kube/config"
  }
}

###########################################################
################ S3 Bucket(s) #################

resource "aws_kms_key" "bucket-key" {
  description             = "This key is used to encrypt objects in the bucket"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "bucket" {
  bucket_prefix = "ci-velero-"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket-enc" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.bucket-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_cors_configuration" "bucket-cors-policy" {
  bucket = aws_s3_bucket.bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = []
  }

  cors_rule {
    allowed_headers = ["Authorization"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket-ownership" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
  depends_on = [aws_s3_bucket_ownership_controls.bucket-ownership]
}

###########################################################
################ Access Key #################
resource "aws_iam_user" "bucket-user" {
  name = "ci-velero-s3-user"
  path = "/ci-velero-s3-user/"
}

data "aws_iam_policy_document" "bucket-policy-doc" {
  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.bucket.arn]
  }
  statement {
    actions   = ["s3:*Object"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]
  }

  statement {
    actions = [
      "kms:GenerateDataKey",
      "kms:Decrypt"
    ]
    resources = [aws_kms_key.bucket-key.arn]
  }
}

resource "aws_iam_user_policy" "bucket-access-key-policy" {
  name   = "ci-velero-s3-user-policy"
  user   = aws_iam_user.bucket-user.name
  policy = data.aws_iam_policy_document.bucket-policy-doc.json
}

resource "aws_iam_access_key" "bucket-access-key" {
  user = aws_iam_user.bucket-user.name
}