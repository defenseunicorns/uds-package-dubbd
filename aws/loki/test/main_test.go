package test_test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"test_test/utils"
	"testing"
)

func TestLokiBucketCreated(t *testing.T) {
	utils.OverrideTerraformForTests(t)
	defer utils.RemoveTerraformOverride(t)

	expectedBucketName := "loki-test"
	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"name":          "loki-test-bucket",
			"force_destroy": "true",
			"create_irsa":   "false",
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	actualBucketName := terraform.Output(t, terraformOptions, "s3_bucket")
	assert.Contains(t, actualBucketName, expectedBucketName, "Bucket name should contain: "+expectedBucketName)

	// todo: check KMS key?
	// todo: cleanup .terraform artifacts?
}
