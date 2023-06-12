# Defense Unicorns Big Bang Distro for AWS (DUBBD-AWS)

## Prerequisites

- Zarf CLI installed locally. Minimum version of `v0.27.1`
- AWS EKS cluster -- K8s v1.26+
- AWS EKS cluster has Zarf init package deployed (with `git-server` component)
- Local K8s context is pointing to the above cluster
- Existing S3 bucket with a Terraform state file present and DynamoDB table for state locking
- A `~/.docker/config.json` file. Zarf [currently requires this](https://github.com/defenseunicorns/zarf/issues/1795) to deploy from an OCI registry

## Build the package (optional)
This section describes how to build a DUBBD-AWS package locally. If you just want to deploy DUBBD-AWS skip this step!

```bash
# Login to the registry
set +o history
export REGISTRY1_USERNAME="YOUR-USERNAME-HERE"
export REGISTRY1_PASSWORD="YOUR-PASSWORD-HERE"
echo $REGISTRY1_PASSWORD | zarf tools registry login registry1.dso.mil --username $REGISTRY1_USERNAME --password-stdin
set -o history

# Create the zarf package
zarf package create --architecture amd64 --confirm

# (Optionally) Publish package to an OCI registry
```

## Configure DUBBD-AWS
The recommended way to configure DUBBD-AWS is via a `zarf-config.yaml` file located in the same directory that you will be performing the deploy in. The available `zarf-config.yaml` configurations are shown below, note the keys that are not commented out are **required** to deploy DUBBD-AWS. 

```yaml
  deploy:
    set:
      # -- Domain name for the EKS cluster
      domain: bigbang.dev
      # -- Public TLS Key
      public_key_file: bigbang.dev.key
      # -- Private TLS key
      public_cert_file: bigbang.dev.cert
      # -- Name of the EKS cluster
      name: "big-bang-aws"
      # -- Name of existing Terraform state bucket
      state_bucket_name: uds-dev-state-bucket
      # -- Key path to Terraform state file within the bucket
      state_key: tfstate/dev/uds-dev-state-bucket.tfstate
      # -- Name of DynamoDB table used for Terraform state locking
      state_dynamodb_table_name: uds-dev-state-dynamodb
      # -- AWS region
      region: us-west-2
      # -- Bring your own kms key, if omitted a key will be created with an alias prefix of "<cluster name>-loki-"
      #loki_kms_key_arn: "arn:aws:kms:us-west-2:000000000000:key/mrk-0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a"
      # -- if set to true, delete the S3 bucket and corresponding KMS key associated with the Loki bucket
      #loki_force_destroy: "true"
```

## Deploy the package
Once all of the prereqs are met and the `zarf-config.yaml` has been configured:
```bash
# To deploy from OCI (recommended)
zarf package deploy oci://ghcr.io/defenseunicorns/packages/big-bang-distro-aws:<VERSION>-amd64 \
  --oci-concurrency=15 \
  --confirm
```
Note that package versions can be found in the [Defense Unicorns GHCR repo](https://github.com/defenseunicorns/uds-package-dubbd/pkgs/container/packages%2Fdubbd-aws).


If developing locally:
```bash
zarf package deploy --confirm zarf-package-big-bang-*.tar.zst
```



## Additional Information

When running Big Bang on AWS, Loki is configured to use S3 for storage for better persistance.  The Zarf package for DUBBD-AWS is created by overlaying a
new loki values file on top of the existing DUBBD zarf file via:

```yaml
- name: bigbang
  required: true
  import:
    path: ../defense-unicorns-distro
  extensions:
    bigbang:
      version: "###ZARF_PKG_VAR_BIGBANG_VERSION###"
      valuesFiles:
      - values/aws-loki.yaml
```

In order for this configuration to work cleanly, DUBBD-AWS also provisions an S3 bucket from our [IaC Repo](https://github.com/defenseunicorns/terraform-aws-uds-s3) that provides encryption at rest and a role to access the S3 bucket that gets used by Loki via [IRSA](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html).
