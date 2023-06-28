# CloudTrail

Small zarf package for deploying CloudTrail.

## Config

To configure this zarf package you can use a `zarf-config.yaml` with the following options specified:

```yaml
package:
  create:
    max_package_size: "1000000000"
    set:
      terraform_version: "1.4.2"
      terraform_provider_aws_version: 4.59.0
  deploy:
    set:
      # -- Name of existing Terraform state bucket
      state_bucket_name: uds-dev-state-bucket
      # -- Key path to Terraform state file within the bucket
      state_key: tfstate/dev/uds-dev-state-bucket.tfstate
      # -- Name of DynamoDB table used for Terraform state locking
      state_dynamodb_table_name: uds-dev-state-dynamodb
      # -- AWS region
      region: us-west-2
      # -- CloudTrail name
      cloudtrail_name: "uds-dev"
```

Note that the `package.create` options are used at build/creation time and should not be modified from the defaults.
