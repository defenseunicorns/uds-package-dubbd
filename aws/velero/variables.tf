variable "name" {
  description = "Name for cluster"
  type        = string
}

variable "kms_key_arn" {
  type        = string
  description = "KMS Key ARN if known, if not, will be generated"
  default     = null
}

variable "key_alias" {
  description = "alias for KMS Key"
  default     = "bigbang-velero"
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


variable "bucket_name" {
  description = "Name for S3 bucket"
  type        = string
}

variable "kubernetes_service_account" {
  description = "Name of the service account to bind to. Used to generate fully qualified subject for service account."
  type        = string
}

variable "kubernetes_namespace" {
  description = "Name of the namespace that the service account exists in. Used to generate fully qualified subject for the service account."
  type        = string
}
