## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rke2"></a> [rke2](#module\_rke2) | git::https://github.com/rancherfederal/rke2-aws-tf.git | v2.3.3 |

## Resources

| Name | Type |
|------|------|
| [null_resource.kubeconfig](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | AMI to use for deployment | `string` | `"ami-03fc394d884ee7d48"` | no |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Add public IPs for nodes | `bool` | `true` | no |
| <a name="input_controlplane_internal"></a> [controlplane\_internal](#input\_controlplane\_internal) | Make controlplane internal | `bool` | `false` | no |
| <a name="input_iam_permissions_boundary"></a> [iam\_permissions\_boundary](#input\_iam\_permissions\_boundary) | Permissions boundary for IAM Role | `string` | `"arn:aws:iam::248783118822:policy/unicorn-base-policy"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for cluster | `string` | `"dubbd-rke2-ci"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to use for deployment | `string` | `"us-west-2"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnets to deploy into | `list(string)` | <pre>[<br>  "subnet-0d0da65a31bcaa9dc",<br>  "subnet-0f9c052423f4ca602",<br>  "subnet-0bf47e35d4b60f338"<br>]</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to deploy into | `string` | `"vpc-0a069641d8ea3aba6"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig_path"></a> [kubeconfig\_path](#output\_kubeconfig\_path) | n/a |
