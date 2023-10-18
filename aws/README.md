# Defense Unicorns Big Bang Distro for AWS (DUBBD-AWS)

## Prerequisites

- Zarf CLI installed locally. Minimum version of `v0.30.1`
- AWS EKS cluster -- K8s v1.26+
- AWS EKS cluster has Zarf init package deployed (with `git-server` component)
- Local K8s context is pointing to the above cluster
- Existing AWS S3 bucket with a Terraform state file present and AWS DynamoDB table for state locking
- Existing AWS S3 bucket with KMS key and IRSA for Loki logs
- Existing AWS S3 bucket with KMS key and IRSA for Velero backups
- A `~/.docker/config.json` file. Zarf [currently requires this](https://github.com/defenseunicorns/zarf/issues/1795) to deploy from an OCI registry

## Build the package (optional)

If you just want to deploy DUBBD-AWS skip this step! Otherwise, [follow the steps to build a package](../docs//building-package.md).

## Configure DUBBD-AWS

The recommended way to configure DUBBD-AWS is via a `zarf-config.yaml` file located in the **same directory that you will be performing the deploy**. The available `zarf-config.yaml` configurations are shown below.

> Note the keys that are not commented out are **required** to deploy DUBBD-AWS.

```yaml
package:
  deploy:
    set:
      # -- Domain name for the EKS cluster
      domain: bigbang.dev
      # -- TLS key
      key_file: bigbang.dev.key
      # -- TLS cert
      cert_file: bigbang.dev.cert
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
      # -- Provision a private/internal load balancer for the admin ingress gateway, if false a public load balancer will be provisioned
      private_admin_lb: true
      # -- Provision a private/internal load balancer for the tenant ingress gateway, if false a public load balancer will be provisioned
      private_tenant_lb: true
      # -- If set to true, force delete all resources on removal (i.e. loki S3 bucket, PVCs, etc)
      ephemeral: false
      # -- If set to true, delete the S3 bucket and corresponding KMS key associated with the Loki bucket. Overrides ephemeral setting.
      #loki_force_destroy: "true"
```

## Deploy the package

Once all of the prereqs are met and the `zarf-config.yaml` has been configured:

```bash
# To deploy from OCI (recommended)
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd-aws:<VERSION>-amd64 \
  --oci-concurrency=15 \
  --confirm
```

Note that package versions can be found in the [Defense Unicorns GHCR repo](https://github.com/defenseunicorns/uds-package-dubbd/pkgs/container/packages%2Fdubbd-aws).

If you created the package locally:

```bash
zarf package deploy --confirm zarf-package-dubbd-aws-*.tar.zst
```

## Additional Information

When running Big Bang on AWS, Loki is configured to use S3 for storage for better persistance. The Zarf package for DUBBD-AWS is created by overlaying a new loki values file on top of the existing DUBBD zarf file via:

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

## Upgrading DUBBD

[See the upgrading DUBBD docs](../docs/upgrade-dubbd.md)
