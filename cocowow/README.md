# CoCoWoW

Pre-built Zarf Package of [DoD-Platform-One/big-bang](https://github.com/DoD-Platform-One/big-bang) configured for production use by Defense Unicorns.
This packages builds on DUBBD with the addition of Keycloak and Authservice. A mock mission app is found in the `podinfo`
directory with instructions to deploy it on day 2.


## Prerequisites

- Zarf is installed locally, minimum version being [v0.26.4](https://github.com/defenseunicorns/zarf/releases/tag/v0.26.4)
- Optional: A working Kubernetes cluster on v1.26+ -- e.g k3d, k3s, KinD, etc (Zarf can be used to deploy a built-in k3s distribution)
- Working kube context (`kubectl get nodes` <-- this command works)


## Build

```
zarf package create --confirm
```

## Deploy
```
zarf package deploy /path/to/zarf-init* --components git-server --confirm
zarf package deploy ./zarf-package* --confirm
```

or optionally, if Keycloak needs to be configured post-deployment:
```
zarf package deploy ./zarf-package* --components configure-keycloak --confirm

```

## Day 2
See the `podinfo` directory for further instructions to deploy and SSO-enable an app on Day 2.
