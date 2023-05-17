
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

output "dynamodb_name" {
  value = module.S3.dynamodb_name
}

output "eks_cluster_oidc_arn" {
  description = "The ARN of the OIDC Provider of the EKS Cluster"
  value       = local.oidc_arn
}

output "kms_key_arn" {
  description = "The ARN of the OIDC Provider of the EKS Cluster"
  value       = local.kms_key_arn
}
