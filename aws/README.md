# Defense Unicorns Big Bang Distro for AWS (DUBBD-AWS)

## Prerequisites

- Zarf cli installed locally. Minimum version of `v0.27.0`
- AWS EKS cluster -- k8s v1.26+
- AWS EKS cluster has zarf init package deployed (with git-server component)
- Working kube context (`kubectl get nodes` <-- this command works)
- Existing S3 bucket with a Terraform state file present
- A `~/.docker/config.json` file. Zarf [currently requires this](https://github.com/defenseunicorns/zarf/issues/1795) to deploy from an OCI registry

## Build the package

**Note**: If you would rather deploy a pre-built package from our registry, you can skip building the package yourself.

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

## Modify zarf-config.yaml as needed

**Note**: Ensure your `zarf-config.yaml` file is in the same directory from where you run `zarf package deploy`

```yaml
package:
  deploy:
    set:
      domain: bigbang.dev
      public_key_file: bigbang.dev.key
      public_cert_file: bigbang.dev.cert
      name: "big-bang-aws"
      state_bucket_name: <YOUR_BUCKET_NAME>
      state_key: <YOUR_TERRAFORM_STATE_KEY> # Path to the state file key in the state bucket
      state_dynamodb_table_name: <YOUR_DYNAMODB_TABLE_NAME>
      region: <YOUR_REGION>
      # Bring your own kms key, if omitted a key will be created with an alias prefix of "<cluster name>-loki-"
      loki_kms_key_arn: <YOUR_KMS_KEY_ARN>
      loki_force_destroy: "true"
```

## Deploy the package

```bash
# Verify all prereqs are met

# Run the zarf package deploy command
zarf package deploy --confirm zarf-package-big-bang-*.tar.zst

# (Alternatively) Deploy from OCI
# Login to the registry
# Run the zarf package deploy command with the desired DUBBD OCI package version
VERSION="YOUR_VERSION"

zarf package deploy oci://ghcr.io/defenseunicorns/packages/big-bang-distro-aws:$VERSION-amd64 \
  --oci-concurrency=15 \
  --confirm
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
