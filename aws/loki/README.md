# Loki 

Terraform for deploying resources necessary for Loki

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_S3"></a> [S3](#module\_S3) | github.com/defenseunicorns/delivery-aws-iac//modules/s3-irsa | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.existing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Option to set force destroy | `bool` | `false` | no |
| <a name="input_key_alias"></a> [key\_alias](#input\_key\_alias) | alias for KMS Key | `string` | `"bigbang-loki"` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | n/a | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name for cluster | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | n/a |
| <a name="output_dynamodb_name"></a> [dynamodb\_name](#output\_dynamodb\_name) | n/a |
| <a name="output_eks_cluster_oidc_arn"></a> [eks\_cluster\_oidc\_arn](#output\_eks\_cluster\_oidc\_arn) | The ARN of the OIDC Provider of the EKS Cluster |
| <a name="output_irsa_role"></a> [irsa\_role](#output\_irsa\_role) | n/a |
| <a name="output_s3"></a> [s3](#output\_s3) | n/a |
| <a name="output_s3_bucket"></a> [s3\_bucket](#output\_s3\_bucket) | n/a |
<!-- END_TF_DOCS -->
