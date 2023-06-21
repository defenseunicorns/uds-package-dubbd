output "eks_cluster_oidc_arn" {
  description = "The ARN of the OIDC Provider of the EKS Cluster"
  value       = module.cluster[0].oidc_provider_arn
}
