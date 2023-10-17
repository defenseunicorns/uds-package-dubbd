# Defense Unicorns Big Bang Distro for K3D (DUBBD-k3d)

This page shows you how to bootstrap a [`k3d`](https://k3d.io) cluster for DUBBD deployment and development.

[On linux systems, "out of the box" `zarf` supports this use case with `k3s`](https://docs.zarf.dev/docs/zarf-tutorials/creating-a-k8s-cluster-with-zarf). This `k3d` variant was created to provide performance and scalability improvements arising from its container-based implementation vs `k3s`' virtual machine-based implementation.

## Prerequisites

> **Warning**
>
> Minimum compute requirements for single node deployment are at LEAST 48 GB RAM and 12 virtual CPU threads (preferrably in a VM)

[Make sure you've setup the prerequisites](../docs/prereq-steps.md)

## Create and Bootstrap `k3d` cluster

1. [Follow the common steps for building a package](../docs/building-package.md)

1. The [`k3d/local`](./local) sub-folder defines the `k3d-local` zarf package that, when created and deployed, creates a local k3d cluster and bootstraps it with:

1. zarf init package
   1. Components specified by [`init_components` in `k3d/local/zarf-config.yaml`](./local/zarf-config.yaml#L12).
1. metallb load balancer

```bash
cd k3d/local
zarf package create --confirm
zarf package deploy --confirm zarf-package-k3d-local-<ARCH>-<ZARF_VERSION>.tar.zst
```

> **Note**
> The `k3d-local` package itself may only be _deployed_ to `amd64`, a limitation inherited from DUBBD via IronBank.
> This `architecture:` constraint is declaratively hard-coded in [`zarf-config.yaml`](./zarf-config.yaml).

> **Note**
> Package _creation_ may be performed on any system/arch, regardless of the package arch (analogous to [cross-compilation](https://en.wikipedia.org/wiki/Cross_compiler)).

> **Warning**
> The `k3d-local` package can only be _created_ on amd64 systems, because:
>
> - The `k3d-local` package downloads the `zarf init` package using `zarf tools download-init`
> - [This zarf bug](https://github.com/defenseunicorns/zarf/issues/1837) means `zarf tools download-init` always uses the architecture of the host system.
>   This could be worked around with biz logic in our `cmd:` action, but we decided to postpone this in favor of waiting for the bugfix.

### Validate kubectl context

Deploying the `k3d-local` zarf package runs [`k3d.sh`](./local/scripts/k3d.sh), which merges the new k3d cluster's kubeconfig into your kubeconfig file and sets it as the current kubectl context.

At this point you should be able to validate that you can access the k3d cluster and that it has been bootstrapped as expected with e.g. `zarf tools kubectl get pods -A` and `zarf tools k9s`.

See below references for more info on managing kubeconfigs: - https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters - https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig - https://github.com/ahmetb/kubectx

## Build and Deploy the DUBBD-k3d zarf package

### Create the zarf package

```bash
zarf package create --confirm
```

### (Optionally) Publish package to the OCI registry

```bash
zarf package publish --oci-concurrency=15
```

### Deploy the package

```bash
# Modify zarf-config.yaml as needed

# Verify all prereqs are met

# Deploy the zarf package, EITHER the..
#  locally-created package .zst file
zarf package deploy --confirm zarf-package-dubbd-*.tar.zst
#  OR a published OCI package (browse release at
#    https://github.com/defenseunicorns/uds-package-dubbd/pkgs/container/packages%2Fdubbd-k3d)
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd-k3d:0.0.1-amd64 --oci-concurrency=15
```

### Additional Information

When running Big Bang locally, it is common to use local storage using hostpath and some other helm component values must be adjusted. The Zarf package for DUBBD-k3d is created by overlaying a new local dev values file on top of the existing DUBBD zarf file via:

```yaml
- name: bigbang
  required: true
  import:
    path: ../defense-unicorns-distro
  extensions:
    bigbang:
      version: "###ZARF_PKG_VAR_BIGBANG_VERSION###"
      valuesFiles:
        - values/local-dev.yaml
```
