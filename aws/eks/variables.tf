variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "name_prefix" {
  description = "Name to prefix in front of resources."
  type        = string
}

variable "cluster_endpoint_private_access" {
  description = "Enable private access to the cluster endpoint"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Enable public access to the cluster endpoint"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "VPC ID where to deploy the cluster"
  type        = string
  default     = null
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
  default     = null
}

variable "private_subnets" {
  description = "Comma-separated list of private subnet IDs"
  type        = string
  default     = null
}

variable "public_subnets" {
  description = "Comma-separated list of public subnet IDs"
  type        = string
  default     = null
}

variable "create_aws_auth_configmap" {
  description = "Determines whether to create the aws-auth configmap. NOTE - this is only intended for scenarios where the configmap does not exist (i.e. - when using only self-managed node groups). Most users should use `manage_aws_auth_configmap`"
  type        = bool
  default     = false
}

variable "manage_aws_auth_configmap" {
  description = "Determines whether to manage the aws-auth configmap"
  type        = bool
  default     = false
}
