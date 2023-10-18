# Defense Unicorns Big Bang Distro (DUBBD)

Pre-built Zarf Package of [DoD-Platform-One/big-bang](https://github.com/DoD-Platform-One/big-bang) configured for production use by Defense Unicorns.

## Prerequisites

- Zarf is installed locally with a minimum version of [v0.30.1](https://github.com/defenseunicorns/zarf/releases/tag/v0.30.1)
- Optional: A working Kubernetes cluster on v1.26+ -- e.g k3d, k3s, KinD, etc (Zarf can be used to deploy a built-in k3s distribution)
- Working kube context (`kubectl get nodes` <-- this command works)

## Quickstart Deploy

```bash
zarf init
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd:<desired-tag> # search tags at https://github.com/defenseunicorns/uds-package-dubbd/pkgs/container/packages%2Fdubbd
```

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

## Example DUBBD Deployment

For AWS follow steps [here](./aws/README.md#deploy-the-package)

For K3d follow steps [here](./k3d/README.md#deploy-the-package)

## Releases

### When to expect new releases

New DUBBD versions can be expected (at a minimum) shortly after each Big Bang release is available.

Following semantic versioning for releases, a new release version is created upon implementing changes that are categorized as fixes or features.

### Creating releases

See [DUBBD Releases](./docs/howto-dubbd-release.md) for more information.
