> [!IMPORTANT]
> DUBBD will be maintained until summer of 2024, when it will be deprecated in favor of [uds-core](https://github.com/defenseunicorns/uds-core)

# Defense Unicorns Big Bang Distro (DUBBD)

Pre-built Zarf Package of [DoD-Platform-One/big-bang](https://github.com/DoD-Platform-One/big-bang) configured for production use by Defense Unicorns.

## Prerequisites

- Zarf is installed locally with a minimum version of [v0.32.1](https://github.com/defenseunicorns/zarf/releases/tag/v0.32.1)
- Optional: A working Kubernetes cluster on v1.27+ -- e.g k3d, k3s, RKE2, etc (Zarf can be used to deploy a built-in k3s distribution)
- Working kube context (`kubectl get nodes` <-- this command works)

_For additional information see [here](./docs/prereq-steps.md)._

## Quickstart Deploy

### k3d

Assumes you've followed the prerequisites and have a k3d cluster running.

```bash
zarf init --components=git-server --confirm
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd-k3d:<VERSION> # search tags at https://github.com/defenseunicorns/uds-package-dubbd/pkgs/container/packages%2Fdubbd-k3d
```

#### Confirm Deployment

```bash
zarf tools kubectl get pods -A
```

For deploying other flavors of DUBBD:

- [DUBBD AWS](./aws/README.md)
- [DUBBD RKE2](./rke2/README.md)
- [DUBBD K3D with Metallb](./k3d/README.md)

## DUBBD repo details

- [aws](./aws/) - _DUBBD for aws (EKS)_
  - [dubbd-aws](./aws/dubbd-aws) - _DUBBD package for aws (imports DUBBD base)_
  - k8s-manifests - _k8s manifest files for aws_
  - values - _values file overrides for aws_
- [defense-unicorns-distro](./defense-unicorns-distro/) - _base DUBBD package definition_
  - manifests - _k8s manifests_
    - alerts - _k8s manifests for alerting_
  - scripts - _scripts for zarf package_
- [k3d](./k3d/) - _DUBBD for k3d (local development)_
  - values - _values file overrides for k3d_
- [rke2](./rke2/) - _DUBBD for rke2_
  - values - _values file overrides for rke2_
- [values](./values/) - _shared values files_

## Releases

### When to expect new releases

New DUBBD versions can be expected (at a minimum) shortly after each Big Bang release is available.

Following semantic versioning for releases, a new release version is created upon implementing changes that are categorized as fixes or features.

### Creating releases

See [DUBBD Releases](./docs/howto-dubbd-release.md) for more information.

## Contributing

Please see the [CONTRIBUTING.md](./CONTRIBUTING.md).
