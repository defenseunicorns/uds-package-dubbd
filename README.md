# Defense Unicorns Big Bang Distro (DUBBD)

Pre-built Zarf Package of [DoD-Platform-One/big-bang](https://github.com/DoD-Platform-One/big-bang) configured for production use by Defense Unicorns.

## Prerequisites
- Zarf is installed. Current version used is: [v0.25.0](https://github.com/defenseunicorns/zarf/releases/tag/v0.25.0)
- Optional: A working Kubernetes cluster. e.g KinD, k3d, k3s, etc. If necessary, Zarf can be used to deploy a built-in k3s distribution.

## Build the package

```bash
$ cd defense-unicorns-distro
$ zarf package create --confirm
....
```

## Deploy the package

### Prereqs

Assumption is that there's a Kubernetes cluster that's already had `zarf init` run on it.

### Install Big Bang

2. Deploy the Big Bang package created in the Build step above:

```bash
zarf package deploy zarf-package-big-bang-amd64-*.tar.zst --confirm
```

Check whether the deployment succeeded. If the deployment is successful, then you should see this message from the HelmRelease resource in the cluster.

``` bash
$ kubectl get helmrelease -A
NAMESPACE   NAME             AGE     READY   STATUS
bigbang     bigbang          9m28s   True    Release reconciliation succeeded
bigbang     istio            9m16s   True    Release reconciliation succeeded
bigbang     istio-operator   9m16s   True    Release reconciliation succeeded
bigbang     jaeger           9m16s   True    Release reconciliation succeeded
bigbang     kiali            9m16s   True    Release reconciliation succeeded
bigbang     kyverno          9m16s   True    Release reconciliation succeeded
bigbang     loki             9m16s   True    Release reconciliation succeeded
bigbang     minio            9m16s   True    Release reconciliation succeeded
bigbang     minio-operator   9m16s   True    Release reconciliation succeeded
bigbang     monitoring       9m16s   True    Release reconciliation succeeded
bigbang     promtail         9m16s   True    Release reconciliation succeeded
```


## Defense Unicorns Big Bang Distro for AWS (DUBBD-AWS)

:::warning
This Zarf package can only be built with the current head of https://github.com/defenseunicorns/zarf due to fixing [this issue](https://github.com/defenseunicorns/zarf/pull/1477)
:::


When running Big Bang on AWS, Loki is configured to use S3 for storage for better persistance.  The Zarf package for DUBBD-AWS is created by overlaying a new loki values file on top of the existing DUBBD zarf file via:

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