variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "name_prefix" {
  description = "Name to prefix in front of resources."
  type        = string
}

variable "kms_key_arn" {
  type        = string
  description = "KMS Key ARN if known, if not, will be generated"
  default     = null
}

variable "key_alias" {
  description = "alias for KMS Key"
  default     = "bigbang-loki"
}

variable "force_destroy" {
  description = "Option to set force destroy"
  type        = bool
  default     = false
}

variable "key_owner_arns" {
  description = "ARNS of KMS key owners, needed for use of key"
  type        = list(string)
  default     = []
}


# taken from zarf bb repo
variable "kms_key_deletion_window" {
  description = "Waiting period for scheduled KMS Key deletion. Can be 7-30 days."
  type        = number
  default     = 7
}

variable "create_kms_key" {
  description = "Whether to create a new KMS key to be used with the S3 bucket.  If not, you must pass in your own key ARN."
  type        = bool
  default     = true
}

###### EKS ######

variable "oidc_provider_arn" {
  description = "OIDC ARN if not creating a new EKS cluster."
  type        = string
  default     = null
}

variable "create_cluster" {
  description = "Whether to create a new EKS cluster.  false to use an existing cluster."
  type        = bool
  default     = true
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

###### VPC ######
variable "create_vpc" {
  description = "Whether to create a new VPC."
	type        = bool
  default     = false
}

variable "vpc_id" {
  description = "Use this VPC instead of creating a new one."
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

variable "private_subnets_cidr_blocks" {
  description = "Comma-separated list of private subnet CIDR blocks"
  type    = string
  default = null
}
