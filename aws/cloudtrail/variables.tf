variable "name" {
  description = "Name of the trail"
  type        = string
}

variable "use_external_s3_bucket" {
  description = "Whether to use an existing S3 bucket for CloudTrail logs. If false, a new S3 bucket will be created with sensible defaults that checks most (but not all) of the boxes for security. Note that it is best practice to use an S3 bucket in a separate security boundary with limited access (a separate AWS account). See https://aws.amazon.com/blogs/mt/aws-cloudtrail-best-practices/"
  type        = bool
  default     = false
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to use for CloudTrail logs. Required if use_external_s3_bucket is true."
  type        = string
  default     = null
}

variable "key_owner_arns" {
  description = "ARNS of KMS key owners, needed for use of key"
  type        = list(string)
  default     = []
}
