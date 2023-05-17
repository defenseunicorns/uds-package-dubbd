variable "name" {
  description = "Name for cluster"
}

variable "kms_key_arn" {

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
