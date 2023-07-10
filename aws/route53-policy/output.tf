output "route53_role_arn" {
  description = "ARN of the IAM Policy created for external-dns to manage records in route53."
  value = module.irsa.role_arn
}
