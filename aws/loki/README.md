# Loki 

Terraform for deploying resources necessary for Loki

## Configurations 

For Loki can be deployed a few different ways. Please consider the following.

### Local Backend
To a local backend, `tfstate_bucket_name` must be set to `null`.

### Remote S3 Backend
To use a remote backend, set the name of `tfstate_bucket_name` to the name of the bucket. Ideally one should also set the the name of the DynameDB locktable with `tfstate_locktable_name`.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_S3"></a> [S3](#module\_S3) | github.com/defenseunicorns/uds-iac-aws-s3 | v0.0.1-alpha |
| <a name="module_generate_kms"></a> [generate\_kms](#module\_generate\_kms) | github.com/defenseunicorns/uds-iac-aws-kms | v0.0.1-alpha |

## Resources

| Name | Type |
|------|------|
| [local_file.terraform_backend_config](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_id.default](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.existing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_kms_key"></a> [create\_kms\_key](#input\_create\_kms\_key) | Whether to create a new KMS key to be used with the S3 bucket.  If not, you must pass in your own key ARN. | `bool` | `true` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Option to set force destroy | `bool` | `false` | no |
| <a name="input_key_alias"></a> [key\_alias](#input\_key\_alias) | alias for KMS Key | `string` | `"bigbang-loki"` | no |
| <a name="input_key_owner_arns"></a> [key\_owner\_arns](#input\_key\_owner\_arns) | ARNS of KMS key owners, needed for use of key | `list(string)` | `[]` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | KMS Key ARN if known, if not, will be generated | `string` | `null` | no |
| <a name="input_kms_key_deletion_window"></a> [kms\_key\_deletion\_window](#input\_kms\_key\_deletion\_window) | Waiting period for scheduled KMS Key deletion. Can be 7-30 days. | `number` | `7` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for cluster | `any` | n/a | yes |
| <a name="input_tfstate_bucket_name"></a> [tfstate\_bucket\_name](#input\_tfstate\_bucket\_name) | Tfstate backend S3 bucket name | `string` | `null` | no |
| <a name="input_tfstate_locktable_name"></a> [tfstate\_locktable\_name](#input\_tfstate\_locktable\_name) | Tfstate DynamoDB locktable name | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | n/a |
| <a name="output_eks_cluster_oidc_arn"></a> [eks\_cluster\_oidc\_arn](#output\_eks\_cluster\_oidc\_arn) | The ARN of the OIDC Provider of the EKS Cluster |
| <a name="output_irsa_role"></a> [irsa\_role](#output\_irsa\_role) | n/a |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | The ARN of the OIDC Provider of the EKS Cluster |
| <a name="output_s3"></a> [s3](#output\_s3) | n/a |
| <a name="output_s3_bucket"></a> [s3\_bucket](#output\_s3\_bucket) | n/a |
<!-- END_TF_DOCS -->
