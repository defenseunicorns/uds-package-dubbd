output "bucket_id" {
  value = aws_s3_bucket.this[*].id
}

output "trail_arn" {
  value = aws_cloudtrail.this.arn
}

output "trail_home_region" {
  value = aws_cloudtrail.this.home_region
}

output "trail_id" {
  value = aws_cloudtrail.this.id
}