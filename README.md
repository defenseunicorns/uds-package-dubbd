# Defense Unicorns Big Bang Distro (DUBBD)

Pre-built Zarf Package of [DoD-Platform-One/big-bang](https://github.com/DoD-Platform-One/big-bang) configured for production use by Defense Unicorns.

## Prerequisites

- Zarf is installed locally with a minimum version of [v0.27.1](https://github.com/defenseunicorns/zarf/releases/tag/v0.27.1)
- Optional: A working Kubernetes cluster on v1.26+ -- e.g k3d, k3s, KinD, etc (Zarf can be used to deploy a built-in k3s distribution)
- Working kube context (`kubectl get nodes` <-- this command works)

## DUBBD repo details

- [aws](./aws/) - _DUBBD for aws (EKS)_
  - s3 - _iac for loki and velero
  - values - _values file overrides for aws_
- [defense-unicorns-distro](./defense-unicorns-distro/) - _base DUBBD package definition_
  - manifests - _k8s manifests_
    - alerts - _k8s manifests for alerting_
  - scripts - _scripts for zarf package_
- [k3d](./k3d/) - _DUBBD for k3d (local development)_
  - values - _values file overrides for k3d_
- [values](./values/) - _shared values files_

## Example DUBBD Deployment

For AWS follow steps [here](./aws/README.md#deploy-the-package)

For K3d follow steps [here](./k3d/README.md#deploy-the-package)

## Releases

### When to expect new releases

New DUBBD versions can be expected (at a minimum) shortly after each Big Bang release is available.

Following semantic versioning for releases, a new release version is created upon implementing changes that are categorized as fixes or features.

### Creating releases

The pipeline uses [release-please-action](https://github.com/google-github-actions/release-please-action) for versioning and releasing OCI packages. This will automatically update `metadata.version` field in zarf.yaml to the same version number that is used for the release tag. To make this work, the `version` field must be surrounded by Release Please's annotations,

```yaml
  # x-release-please-start-version
  version: "0.2.1"
  # x-release-please-end
```

More information on this can be found in [Release Please's documentation](https://github.com/googleapis/release-please/blob/main/docs/customizing.md#updating-arbitrary-files).

### How should I write my commits?

Release Please assumes you are using [Conventional Commit messages](https://www.conventionalcommits.org/).

The most important prefixes you should have in mind are:

- `fix:` which represents bug fixes, and correlates to a [SemVer](https://semver.org/)
  patch.
- `feat:` which represents a new feature, and correlates to a SemVer minor.
- `feat!:`,  or `fix!:`, `refactor!:`, etc., which represent a breaking change
  (indicated by the `!`) and will result in a SemVer major.

When the change is merged to the trunk, Release Please will calculate what changes are included and will create another PR to increase the version and tag a new release. This will also automatically generate a new set of packages in the OCI registry.

### Modifying the Monorepo

Use the [release-please-config.json](release-please-config.json) file to add or remove packages for publishing.
