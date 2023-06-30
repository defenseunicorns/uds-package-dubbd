output "aws_region" {
  value = data.aws_region.current.name
}

output "irsa_role" {
  value = module.S3.irsa_role
}

output "s3" {
  value = module.S3
}

output "s3_bucket" {
  value = module.S3.s3_bucket
}

output "kms_key_arn" {
  description = "The ARN of the OIDC Provider of the EKS Cluster"
  value       = local.kms_key_arn
}

output "force_destroy" {
  value = var.force_destroy
}
