# Defense Unicorns Big Bang Distro for AWS (DUBBD-AWS)

## Diagram

![DUBBD AWS](../docs/.images/dubbd-aws-architecture.drawio.png)

## Prerequisites

- [Common Prerequisites](../docs/prereq-steps.md)
- AWS EKS cluster -- K8s v1.26+
- Local K8s context is pointing to the above cluster
- AWS EKS cluster has Zarf init package deployed (with `git-server` component)
  ```bash
  zarf init --components=git-server --confirm
  ```
- Existing AWS S3 bucket with a Terraform state file present and AWS DynamoDB table for state locking
- Existing AWS S3 bucket with KMS key and IRSA for Loki logs
- Existing AWS S3 bucket with KMS key and IRSA for Velero backups

## Build the package (optional)

If you just want to deploy DUBBD-AWS skip this step! Otherwise, [follow the steps to build a package](../docs//building-package.md).

## Configure DUBBD-AWS

The recommended way to configure DUBBD-AWS is via a `zarf-config.yaml` file located in the **same directory that you will be performing the deploy**. The available `zarf-config.yaml` configurations are shown below.

> Note the keys that are not commented out are **required** to deploy DUBBD-AWS.

````yaml
package:
  create:
    max_package_size: "1000000000"
    set:
      bigbang_version: "2.12.0"
      # should line up with the flux version in the BB release, see https://repo1.dso.mil/big-bang/bigbang/-/blob/master/base/flux/gotk-components.yaml#L3
      flux_version: "2.1.1"
  deploy:
    set:
      # -- Domain name for the EKS cluster
      domain: "bigbang.dev"
      # -- TLS key
      key_file: "bigbang.dev.key"
      # -- TLS cert
      cert_file: "bigbang.dev.cert"
      # -- Name of the EKS cluster
      name: "big-bang-aws"
      # -- Provision a private/internal load balancer for the admin ingress gateway, if false a public load balancer will be provisioned
      private_admin_lb: "true"
      # -- Provision a private/internal load balancer for the tenant ingress gateway, if false a public load balancer will be provisioned
      private_tenant_lb: "true"
      # -- If set to true, delete PVs on removal
      ephemeral: "false"
      # -- AWS S3 bucket for use with Loki
      loki_s3_bucket: "big-bang-aws-loki-s3"
      # -- Region of the AWS S3 bucket for use with Loki
      loki_s3_aws_region: "us-west-2"
      # -- Role ARN of the AWS S3 bucket for use with Loki
      loki_s3_role_arn: "arn:aws:iam::000000000000:role/big-bang-aws-0a0a0a0-loki-logging-loki-irsa"
      # -- AWS S3 bucket for use with Velero
      velero_s3_bucket: "big-bang-aws-velero-s3"
      # -- Region of the AWS S3 bucket for use with Velero
      velero_s3_aws_region: "us-west-2"
      # -- Role ARN of the AWS S3 bucket for use with Velero
      velero_s3_role_arn: "arn:aws:iam::000000000000:role/big-bang-aws-0a0a0a0-velero-velero-velero-server-irsa"

## Deploy the package

Once all of the prereqs are met and the `zarf-config.yaml` has been configured:

```bash
# To deploy from OCI (recommended)
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd-aws:<VERSION>-amd64 \
  --oci-concurrency=15 \
  --confirm
````

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

## Local Development

If you're working on development of the dubbd-aws package, you can follow the [developer-notes.md](../docs/developer-notes.md) for a more specific guide on creating the AWS resources needed for successfully testing your package.
