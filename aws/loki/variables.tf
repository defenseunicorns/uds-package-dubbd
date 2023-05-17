variable "name" {
  description = "Name for cluster"
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

