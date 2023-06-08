# Defense Unicorns Big Bang Distro (DUBBD)

Pre-built Zarf Package of [DoD-Platform-One/big-bang](https://github.com/DoD-Platform-One/big-bang) configured for production use by Defense Unicorns.

## Prerequisites

- Zarf is installed locally with a minimum version of [v0.26.1](https://github.com/defenseunicorns/zarf/releases/tag/v0.26.1)
- Optional: A working Kubernetes cluster on v1.26+ -- e.g k3d, k3s, KinD, etc (Zarf can be used to deploy a built-in k3s distribution)
- Working kube context (`kubectl get nodes` <-- this command works)

## DUBBD repo details

- [aws](./aws/) - _DUBBD for aws (EKS)_
  - loki - _iac for loki_
  - values - _values file overrides for aws_
- [defense-unicorns-distro](./defense-unicorns-distro/) - _base DUBBD package definition_
  - manifests - _k8s manifests_
    - alerts - _k8s manifests for alerting_
  - scripts - _scripts for zarf package_
- [k3d](./k3d/) - _DUBBD for k3d (local development)_
  - values - _values file overrides for k3d_
- [values](./values/) - _shared values files_

## Example DUBBD Deployment - using pre-built OCI packages [here](https://github.com/orgs/defenseunicorns/packages?repo_name=uds-package-dubbd)

```bash
# Create a deployment directory and change to that directory
export DUBBD_ENV=dev
mkdir ${DUBBD_ENV}-dubbd-deploy && cd $_

# Stage any files needed for the environment (ex: certs)
# - potentially from KMS
# - or from local path
# - or some other method to retrieve certs

# Create a zarf-config.yaml for the environment below is an example
cat <<EOF> zarf-config.yaml
package:
  deploy:
    set:
      domain: bigbang.dev
      public_key_file: bigbang.dev.key
      public_cert_file: bigbang.dev.cert
      name: "${DUBBD_ENV}-big-bang-cluster"
EOF

# Verify all prereqs are met

# (Optionally) Login to the registry for private images
# https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic
set +o history
export CR_PAT="YOUR-PAT-HERE"
export CR_USR="YOUR-USERNAME_HERE"
echo $CR_PAT | zarf tools registry login ghcr.io --username $CR_USR --password-stdin
set -o history

# Run the zarf package deploy command with desired release (K3d example)
zarf package deploy oci://ghcr.io/defenseunicorns/packages/big-bang-distro-k3d/big-bang-distro-k3d:0.0.1-amd64 --oci-concurrency=15
```
