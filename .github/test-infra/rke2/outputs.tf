output "velero_bucket_access_key" {
  description = "Velero Bucket Access Key ID"
  value       = aws_iam_access_key.bucket-access-key.id
}

output "velero_bucket_access_key_secret" {
  description = "Velero Bucket Access Key Secret"
  value       = aws_iam_access_key.bucket-access-key.secret
  sensitive = true
}