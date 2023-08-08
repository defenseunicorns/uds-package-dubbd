package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/cloudtrail"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

const expectedCloudtrailPrefix = "terratest-cloudtrail"

func TestCloudTrail(t *testing.T) {
	expectedCloudtrailName := os.Getenv("CLOUDTRAIL_NAME")
	region := os.Getenv("BACKEND_REGION")
	if expectedCloudtrailName == "" {
		expectedCloudtrailName = expectedCloudtrailPrefix
	}

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"name": expectedCloudtrailName,
		},
		BackendConfig: map[string]interface{}{
			"bucket":         os.Getenv("BACKEND_BUCKET"),
			"key":            os.Getenv("BACKEND_KEY"),
			"region":         region,
			"dynamodb_table": os.Getenv("BACKEND_DYNAMODB_TABLE"),
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	cloudTrailExists := verifyCloudTrailExists(t, region, expectedCloudtrailName)
	assert.True(t, cloudTrailExists, fmt.Sprintf("CloudTrail %s does not exist in region %s", expectedCloudtrailName, region))
}

func verifyCloudTrailExists(t *testing.T, region, trailName string) bool {
	// Create an AWS session with the target region
	sess, err := session.NewSession(&aws.Config{
		Region: aws.String(region),
	})
	if err != nil {
		t.Logf("Failed to create AWS session: %s", err.Error())
		return false
	}

	// Create an AWS CloudTrail client
	client := cloudtrail.New(sess)

	// Create the input parameters for DescribeTrails API call
	params := &cloudtrail.DescribeTrailsInput{
		TrailNameList: []*string{aws.String(trailName)},
	}

	// Call the DescribeTrails API
	resp, err := client.DescribeTrails(params)
	if err != nil {
		t.Logf("Failed to describe CloudTrail: %s", err.Error())
		return false
	}

	// Check if the CloudTrail with the specified name exists
	for _, trail := range resp.TrailList {
		if aws.StringValue(trail.Name) == trailName {
			return true
		}
	}
	return false
}
