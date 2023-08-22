# RKE2 on AWS

Terraform for deploying resources necessary for RKE2 installed on AWS with variable defaults intended for CI.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_agents"></a> [agents](#module\_agents) | github.com/rancherfederal/rke2-aws-tf//modules/agent-nodepool | v2.4.0 |
| <a name="module_rke2"></a> [rke2](#module\_rke2) | github.com/rancherfederal/rke2-aws-tf | v2.4.0 |

## Resources

| Name | Type |
|------|------|
| [null_resource.kubeconfig](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | AMI to use for deployment, must have RKE2 pre-installed | `string` | `"ami-04953108dd85f6e49"` | no |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Add public IPs for nodes | `bool` | `true` | no |
| <a name="input_controlplane_internal"></a> [controlplane\_internal](#input\_controlplane\_internal) | Make controlplane internal | `bool` | `false` | no |
| <a name="input_iam_permissions_boundary"></a> [iam\_permissions\_boundary](#input\_iam\_permissions\_boundary) | Permissions boundary for IAM Role | `string` | `"arn:aws:iam::248783118822:policy/unicorn-base-policy"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for cluster | `string` | `"dubbd-rke2-ci"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of subnets to deploy into | `list(string)` | <pre>[<br>  "subnet-03bfe6a57d4778e9c",<br>  "subnet-0012c1d0524924400",<br>  "subnet-0b3c32b61de124f01"<br>]</pre> | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of subnets to deploy into | `list(string)` | <pre>[<br>  "subnet-0d0da65a31bcaa9dc",<br>  "subnet-0f9c052423f4ca602",<br>  "subnet-0bf47e35d4b60f338"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Region to use for deployment | `string` | `"us-west-2"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to deploy into | `string` | `"vpc-0a069641d8ea3aba6"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
