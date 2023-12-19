variable "name" {
  description = "Name for cluster"
  type        = string
  default     = "dubbd-rke2-ci"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to deploy into"
  default     = null
}

variable "ami" {
  type        = string
  description = "AMI to use for deployment, must have RKE2 pre-installed"
  # https://github.com/defenseunicorns/uds-rke2-image-builder
  default = null
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

variable "permissions_boundary_name" {
  type        = string
  description = "Permissions boundary name for IAM Role"
  default     = null
}
