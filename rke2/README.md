# Defense Unicorns Big Bang Distro for RKE2 (DUBBD-RKE2)

This package is designed to deploy DUBBD to environments leveraging RKE2 as the Kubernetes distribution.

> **Warning**
> This package is a WIP and not configured for production deployments yet. Notable items:
>
> - You will need to satisfy dependencies of the cluster + storage class
> - Loki will run in a single-pod setup with PVC backed log storage

## Prerequisites

- [Common prerequisites](../docs/prereq-steps.md)
- RKE2 cluster -- K8s v1.27+
- Local K8s context is pointing to the above cluster
- RKE2 cluster has Zarf init package deployed (with `git-server` component)
  ```bash
  zarf init --components=git-server --confirm
  ```
- Existing S3 compatible object storage bucket for Velero backups with a credentials secret

## Configure DUBBD-RKE2

The recommended way to configure DUBBD-RKE2 is via a `zarf-config.yaml` file located in the same directory that you will be performing the deploy. The available `zarf-config.yaml` configurations are shown below.

> Note the keys that are not commented out are **required** to deploy DUBBD-RKE2.

```yaml
package:
  deploy:
    set:
      # -- Domain name for the cluster
      domain: bigbang.dev
      # -- TLS key
      key_file: bigbang.dev.key
      # -- TLS cert
      cert_file: bigbang.dev.cert
      # -- If set to true, force delete all resources on removal (i.e. object storage, PVCs, etc)
      ephemeral: false
```

## Velero
Velero is included by default. This requires that the cluster have access to an object storage provider (such as AWS S3, Minio, Nutanix or others). The default configuration used in CI deploys an instance of Minio and uses it to perform a simple cluster backup on a schedule. This default configuration can be adopted by setting the exposed velero bucket values, but in all likelyhood it will make more sense to provide a custom velero config at deploy time that overrides the `udsbackup` schedule.
