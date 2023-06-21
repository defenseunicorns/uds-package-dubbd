# Defense Unicorns Big Bang Distro for K3D (DUBBD-k3d)

This page shows you how to bootstrap a [`k3d`](https://k3d.io) cluster for DUBBD deployment and development.

[On linux systems, "out of the box" `zarf` supports this use case with `k3s`](https://docs.zarf.dev/docs/zarf-tutorials/creating-a-k8s-cluster-with-zarf). This `k3d` variant was created to provide performance and scalability improvements arising from its container-based implementation vs `k3s`' virtual machine-based implementation.

## Prerequisites

> **Warning**
>
> Minimum compute requirements for single node deployment are at LEAST 48 GB RAM and 12 virtual CPU threads (preferrably in a VM)

1. [Install zarf](https://docs.zarf.dev/docs/getting-started/#installing-zarf)
1. [Install docker](https://docs.docker.com/install/https://docs.docker.com/install/)
1. [Install k3d](https://k3d.io/v5.5.1/#installation)
1. Gain Access to GitHub Container Registry (`ghcr.io`)
    1. Login to your GitHub Account.
    1. [Create a (classic) personal access token](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic) user scoped with `read/write/delete:packages` _as needed_, and store in a secure location.
        1. _Note: use cases that don't publish packages should remove `write:packages` from the access token's scope below._
1. Gain Access to Iron Bank Harbor (`registry1.dso.mil`)
    1. Create account at [Platform One's DevSecOps Collaboration Workspace (https://login.dso.mil)](https://login.dso.mil).
    1. Login to [Harbor (https://registry1.dso.mil)](https://registry1.dso.mil) (SSO Option) with same creds (accepting user agreements).
    1. In upper right corner, click *<your username>* --> *User Profile*, then click the *Copy* icon next to *CLI secret*, and store in a secure and accessible location. 
1. Validate AuthN to Container Registries
    ```bash
    set +o history  # don't let these secrets end up in plain text shell history
    export GITHUB_USER=<github username>
    export GITHUB_PASS=<github container registry personal access token>
    export IRONBANK_USER=<dso.mil username>
    export IRONBANK_PASS=<iron bank cli secret>
    echo $GITHUB_PASS | zarf tools registry login ghcr.io --username $GITHUB_USER --password-stdin
    echo $IRONBANK_PASS | zarf tools registry login registry1.dso.mil --username $IRONBANK_USER --password-stdin
    set -o history
    ```
1. _(Optional)_ Secure Container Registry Secrets with Local Credential Store
    1. [Install and configure a credential store for docker login](https://docs.docker.com/engine/reference/commandline/login/#credentials-store)
    1. Re-validate docker/zarf authN using the credential store configured in `~/.docker/config.json`:
    
    ```bash
    zarf tools registry login ghcr.io --username $GITHUB_USER
    zarf tools registry login registry1.dso.mil --username $IRONBANK_USER
    ```
1. _(Optional)_ [Install kubectl](https://kubernetes.io/docs/tasks/tools/#kubectlhttps://kubernetes.io/docs/tasks/tools/#kubectl)
    1. Standalone installation of `kubectl` is unnecessary because `kubectl` is embedded within the `zarf` binary.
        1. `zarf` builds the latest stable release tag of the [upstream k8s.io cli and cmd sources](https://github.com/defenseunicorns/zarf/blob/ee4da6a938811e3da1801dac284dd2b2e8ee665f/src/cmd/tools/kubectl.go#L11).
    2. This `kubectl` is accessed using [`zarf tools kubectl`](https://docs.zarf.dev/docs/the-zarf-cli/cli-commands/zarf_tools_kubectl).

## Create and Bootstrap `k3d` cluster

The [`k3d/local`](./local) sub-folder defines the `k3d-local` zarf package that, when created and deployed, creates a local k3d cluster and bootstraps it with:

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
> * The `k3d-local` package downloads the `zarf init` package using `zarf tools download-init`
> * [This zarf bug](https://github.com/defenseunicorns/zarf/issues/1837) means `zarf tools download-init` always uses the architecture of the host system.
> This could be worked around with biz logic in our `cmd:` action, but we decided to postpone this in favor of waiting for the bugfix.

### Validate kubectl context 

Deploying the `k3d-local` zarf package runs [`k3d.sh`](./local/scripts/k3d.sh), which merges the new k3d cluster's kubeconfig into your kubeconfig file and sets it as the current kubectl context. 

At this point you should be able to validate that you can access the k3d cluster and that it has been bootstrapped as expected with e.g. `zarf tools kubectl get pods -A` and `zarf tools k9s`.

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

