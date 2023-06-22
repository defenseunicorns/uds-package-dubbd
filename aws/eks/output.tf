output "eks_cluster_oidc_arn" {
  description = "The ARN of the OIDC Provider of the EKS Cluster"
  value       = module.cluster[0].oidc_provider_arn
}

output "cluster_name" {
  description = "Cluster name"
  value       = module.cluster[0].cluster_name
}
