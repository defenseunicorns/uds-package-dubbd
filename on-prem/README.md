# Defense Unicorns Big Bang Distro for On-Premise Environments (DUBBD-On-Prem)

This package is designed to deploy DUBBD to on-prem environments leveraging RKE2 as the Kubernetes distribution.

> **Warning**
> This package is a WIP and not configured for production deployments yet.

## Prerequisites

- Zarf CLI installed locally. Minimum version of `v0.27.1`
- RKE2 cluster -- K8s v1.26+
- RKE2 cluster has Zarf init package deployed (with `git-server` component)
- Local K8s context is pointing to the above cluster
- A `~/.docker/config.json` file. Zarf [currently requires this](https://github.com/defenseunicorns/zarf/issues/1795) to deploy from an OCI registry

## Configure DUBBD-On-Prem

The recommended way to configure DUBBD-On-Prem is via a `zarf-config.yaml` file located in the same directory that you will be performing the deploy. The available `zarf-config.yaml` configurations are shown below. 
> Note the keys that are not commented out are **required** to deploy DUBBD-On-Prem.

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
