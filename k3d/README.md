# Defense Unicorns Big Bang Distro for K3D (DUBBD-k3d)

This page shows you how to bootstrap a k3d cluster for local DUBBD development, experimentation and learning.

## Prerequisites

> **Warning**
>
> Minimum compute requirements for single node deployment are at LEAST 48 GB RAM and 12 virtual CPU threads (preferrably in a VM)

### [Install zarf](https://docs.zarf.dev/docs/getting-started/#installing-zarf)

### [Install docker](https://docs.docker.com/install/https://docs.docker.com/install/)

### Configure AuthN for Container Registries

#### GitHub Container Registry AuthN

1. [Create a (classic) personal access token](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic) for your GitHub user scoped with read/write/delete:packages, and store in a secure location.
    * Note: your use case will only require read:packages if you won't be publishing packages.
2. (Optional) Sanity-check docker/zarf authN to OCI registry at ghcr.io, exporting token as CR_PAT env var:
  1. `echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin`
  2. `echo $CR_PAT | zarf tools registry login ghcr.io -u USERNAME --password-stdin`
3. [Install and configure a credential store for docker login](https://docs.docker.com/engine/reference/commandline/login/#credentials-store)
4. Validate docker/zarf authN to OCI registry at ghcr.io, using credential store configured in `~/.docker/config.json`:
  1. `docker login ghcr.io -u USERNAME`
  2. `zarf tools registry login ghcr.io -u USERNAME`

#### `registry1.dso.mil` AuthN 

```bash
set +o history
export REGISTRY1_USERNAME="YOUR-USERNAME-HERE"
export REGISTRY2_PASSWORD="YOUR-PASSWORD-HERE"
echo $REGISTRY1_PASSWORD | zarf tools registry login registry1.dso.mil --username $REGISTRY1_USERNAME --password-stdin
set -o history
```

### (Optional) [Install kubectl](https://kubernetes.io/docs/tasks/tools/#kubectlhttps://kubernetes.io/docs/tasks/tools/#kubectl)

`kubectl` is embedded within the `zarf` binary, so a standalone installation of `kubectl` is unnecessary. This `kubectl` is accessed using [`zarf tools kubectl`](https://docs.zarf.dev/docs/the-zarf-cli/cli-commands/zarf_tools_kubectl). `zarf` builds the latest stable release tag of the [upstream k8s.io cli and cmd sources](https://github.com/defenseunicorns/zarf/blob/ee4da6a938811e3da1801dac284dd2b2e8ee665f/src/cmd/tools/kubectl.go#L11).)

### [Install k3d](https://k3d.io/v5.5.1/#installation)

### Create and Bootstrap `k3d` cluster

The [`k3d/local/`](./k3d/local) sub-folder defines the `k3d-local` zarf package that, when created and deployed, creates a local k3d cluster and bootstraps it with:

1. zarf init pkg
2. metallb load balancer

```bash
cd k3d/local
zarf package create --confirm
zarf package deploy --confirm zarf-package-k3d-local-<ARCH>-<ZARF_VERSION>.tar.zst 
```

TODO: ensure the k3d package version syncs its k8s version with the dubbd requiremnets (currently v1.26+).

### Validate kubectl context 

Deploying the `k3d-local` zarf package runs [`k3d.sh`](./local/scripts/k3d.sh), which merges the new k3d cluster's kubeconfig into your kubeconfig file and sets it as the current kubectl context. 

At this point you should be able to validate that you can access the k3d cluster and that it has been bootstrapped as expected with e.g. `kubectl get pods -A` and `zarf tools k9s`.

See below references for more info on managing kubeconfigs:
    - https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters
    - https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig
    - https://github.com/ahmetb/kubectx

## Build and Deploy the DUBBD-k3d zarf package

### Create the zarf package

```bash
zarf package create --confirm
```

### (Optionally) Publish package to the OCI registry

```bash
# TODO: check syntax
zarf package publish --oci-concurrency=15
```

### Deploy the package

```bash
# Modify zarf-config.yaml as needed

# Verify all prereqs are met

# Deploy the zarf package, either the..
#   locally-created package .zst file
zarf package deploy --confirm zarf-package-dubbd-*.tar.zst
#   OR the published OCI package 
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd-k3d:0.0.1-amd64 --oci-concurrency=15
```

### Additional Information

When running Big Bang locally, it is common to use local storage using hostpath and some other helm component values must be adjusted.  The Zarf package for DUBBD-k3d is created by overlaying a new local dev values file on top of the existing DUBBD zarf file via:

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

