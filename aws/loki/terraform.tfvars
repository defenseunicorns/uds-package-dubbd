#kms_key_arn   = "###ZARF_VAR_LOKI_KMS_KEY_ARN###"
force_destroy = "###ZARF_VAR_LOKI_FORCE_DESTROY###"

name_prefix = "###ZARF_VAR_NAME###"

# EKS
cluster_endpoint_public_access = "true" #"###ZARF_VAR_EKS_PUBLIC_ACCESS###" #true

# VPC
vpc_cidr = "###ZARF_VAR_VPC_CIDR###" #"192.168.0.0/16"
vpc_id = "###ZARF_VAR_VPC_ID###" #"vpc-03b6e55af0613dda2"
#private_subnets = ["subnet-01158ab94073f7f23", "subnet-02ccea6028a7b16de", "subnet-0566d42b760fdd20c"]
private_subnets = "###ZARF_VAR_PRIVATE_SUBNETS###"
#public_subnets = ["subnet-05718ff8c5ca375e4", "subnet-01fbd45595d1ccdaf", "subnet-0dcd7cf4b147d7134"]
public_subnets = "###ZARF_VAR_PUBLIC_SUBNETS###"
#private_subnets_cidr_blocks = ["192.168.160.0/19", "192.168.96.0/19", "192.168.128.0/19"]
private_subnets_cidr_blocks = "###ZARF_VAR_PRIVATE_SUBNETS_CIDR_BLOCKS###"

region = "###ZARF_VAR_REGION###"
