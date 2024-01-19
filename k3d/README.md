# Defense Unicorns Big Bang Distro for K3D (DUBBD-k3d)

## Prerequisites

[Follow Prerequisite Steps](../docs/prereq-steps.md) -- **Use k3d installation**

> **NOTE**
>
> [On linux systems, "out of the box" `zarf` supports this use case with `k3s`](https://docs.zarf.dev/docs/zarf-tutorials/creating-a-k8s-cluster-with-zarf). This `k3d` variant was created to provide performance and scalability improvements arising from its container-based implementation vs `k3s`' virtual machine-based implementation.

## Build and Deploy the DUBBD-k3d zarf package

### Create the zarf package

For more detailed steps on creating packages please read [howto-packages.md](../docs/howto-packages.md)

**If you just want to deploy an already built package skip this.**

```bash
cd ../ # if you're currently in k3d/local
zarf package create --confirm
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
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd-k3d:<VERSION> --oci-concurrency=15
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
