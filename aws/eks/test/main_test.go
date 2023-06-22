package test_test

import (
  "os"
	"testing"

  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
)

const expectedClusterPrefix = "terratest-cluster"

func TestEksClusterCreated(t *testing.T) {
  terraformOptions := &terraform.Options{
    TerraformDir: "../",
    Vars: map[string]interface{}{
      "region": os.Getenv("INPUT_REGION"),
      "create_cluster": true,
      "name_prefix": expectedClusterPrefix,
      "cluster_endpoint_public_access": true,
      "vpc_id": os.Getenv("INPUT_VPC_ID"),
      "vpc_cidr": os.Getenv("INPUT_VPC_CIDR"),
      "private_subnets": os.Getenv("INPUT_PRIVATE_SUBNETS"),
      "public_subnets": os.Getenv("INPUT_PUBLIC_SUBNETS"),
      "private_subnets_cidr_blocks": os.Getenv("INPUT_PRIVATE_SUBNETS_CIDR_BLOCKS"),
    },

    BackendConfig: map[string]interface{}{
      "bucket": os.Getenv("INPUT_BACKEND_BUCKET"),
      "key":    os.Getenv("INPUT_BACKEND_KEY"),
      "region": os.Getenv("INPUT_BACKEND_REGION"),
    },

    NoColor: true,
  }
  defer terraform.Destroy(t, terraformOptions)

  terraform.InitAndApply(t, terraformOptions)

	actualClusterName := terraform.Output(t, terraformOptions, "cluster_name")
	assert.Contains(t, actualClusterName, expectedClusterPrefix)
}
