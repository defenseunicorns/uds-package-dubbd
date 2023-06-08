# Defense Unicorns Big Bang Distro for K3D (DUBBD-k3d)

This page shows you how to bootstrap a Local Target Cluster for Local Development. When done, you will have a k3d cluster that can be used for zarf package development/testing or as a sandbox for learning more about zarf.

## Prerequisites

> **Warning**
>
> Minimum compute requirements for single node deployment are at LEAST 48 GB RAM and 12 virtual CPU threads (preferrably in a VM)

### Install zarf
### Install zarf’s Init package 

This is unnecessary when deploying a zarf package that includes init e.g. zarf-package-k3d.

### Install docker

### Configure AuthN for GitHub Container Registries


1. Create a (classic) personal access token for your GitHub user scoped with read/write/delete:packages, and store in a secure location.
    * Note: your use case will only require read:packages if you won't be publishing packages.
2. Sanity-check docker/zarf authN to OCI registry at ghcr.io, exporting token as CR_PAT env var:
  1. echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin 
  2. echo $CR_PAT | zarf tools registry login ghcr.io -u USERNAME --password-stdin 
3. Install and configure a credential store for docker login
4. Validate docker/zarf authN to OCI registry at ghcr.io, using credential store configured in ~/.docker/config.json:
  1. docker login ghcr.io -u USERNAME
  2. zarf tools registry login ghcr.io -u USERNAME 

### Install kubectl

### Install k3d

Note: k3d requirements (docker, kubectl) should already be satisfied by Common Configuration.

### Deploy `zarf-package-k3d`

Deploying zarf-package-k3d will create a local k3d cluster and bootstrap it with zarf and metallb load balancer. 

```
zarf package deploy oci://ghcr.io/runyontr/zarf-package-k3d/k3d-local:v1.26.0-amd64 
```

TODO: ensure the k3d package version syncs its k8s version with the dubbd requiremnets (currently v1.26+).
TODO: ensure k3d cluster has zarf init package deployed (with git-server component)

### Validate kubectl context 

TODO: update instructions on managing kubeconfig via `k3d`.

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

# (Optionally) Publish package to the OCI registry
```

## Deploy the package

```bash
# Modify zarf-config.yaml as needed

# Verify all prereqs are met

# Run the zarf package deploy command
zarf package deploy --confirm zarf-package-big-bang-*.tar.zst

# (Alternatively) Deploy from OCI
# Login to the registry
# Run the zarf package deploy command with the desired DUBBD OCI package reference 
zarf package deploy oci://ghcr.io/defenseunicorns/packages/big-bang-distro-k3d/big-bang-distro-k3d:0.0.1-amd64 --oci-concurrency=15
```

## Additional Information

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

