variable "name" {
  description = "Name for cluster"
  type        = string
  default     = "dubbd-rke2-ci"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to deploy into"
  default     = "vpc-0a069641d8ea3aba6"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of subnets to deploy into"
  default     = ["subnet-0d0da65a31bcaa9dc", "subnet-0f9c052423f4ca602", "subnet-0bf47e35d4b60f338"]
}

variable "private_subnets" {
  type        = list(string)
  description = "List of subnets to deploy into"
  default     = ["subnet-03bfe6a57d4778e9c", "subnet-0012c1d0524924400", "subnet-0b3c32b61de124f01"]
}

variable "ami" {
  type        = string
  description = "AMI to use for deployment, must have RKE2 pre-installed"
  # https://github.com/defenseunicorns/uds-rke2-image-builder
  default = "ami-012992f851fa58d5b"
}

variable "region" {
  type        = string
  description = "Region to use for deployment"
  default     = "us-west-2"
}

variable "controlplane_internal" {
  type        = bool
  description = "Make controlplane internal"
  default     = false # Default public for CI
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Add public IPs for nodes"
  default     = true # Default public for CI
}

variable "iam_permissions_boundary" {
  type        = string
  description = "Permissions boundary for IAM Role"
  default     = "arn:aws:iam::248783118822:policy/unicorn-base-policy"
}
