# Defense Unicorns Big Bang Distro for K3D (DUBBD-k3d)

## Prerequisites

> **Warning**
>
> Minimum compute requirements for single node deployment are at LEAST 48 GB RAM and 12 virtual CPU threads (preferrably in a VM)

- Zarf cli installed locally
- Docker installed locally (for image pulls)
- K3D cluster -- k8s v1.26+
- K3D cluster has zarf init package deployed (with git-server component)
- MetalLB deployed to support multiple LoadBalancer service types
- Working kube context (`kubectl get nodes` <-- this command works)

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
