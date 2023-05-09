# Defense Unicorns Big Bang Distro for AWS (DUBBD-AWS)

## Prerequisites

- Zarf cli installed locally
- Docker installed locally (for image pulls)
- AWS EKS cluster
- AWS EKS cluster has zarf init package deployed (with git-server component)
- AWS KMS (with alias)
- Working kube context (`kubectl get nodes` <- this command works)

## Build the package

```bash
# Login to the registry
set +o history
export REGISTRY1_USERNAME="YOUR-USERNAME-HERE"
export REGISTRY1_PASSWORD="YOUR-PASSWORD-HERE"
echo $REGISTRY1_PASSWORD | zarf tools registry login registry1.dso.mil --username $REGISTRY1_USERNAME --password-stdin
set -o history

# Create the zarf package
zarf package create --architecture amd64 --confirm
```

## Deploy the package

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

In order for this configuration to work cleanly, DUBBD-AWS also provisions an S3 bucket from our [IaC Repo](https://github.com/defenseunicorns/iac/tree/main/modules/s3-irsa) that provides encryption at rest and a role to access the S3 bucket that gets used by Loki via [IRSA](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html).
