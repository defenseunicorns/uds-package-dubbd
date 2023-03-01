# zarf-package-big-bang

Pre-built Zarf Package of [DoD-Platform-One/big-bang](https://github.com/DoD-Platform-One/big-bang) core. The current version of Big Bang supported is 1.54.0

## Prerequisites
- Zarf is installed. Current version used is: [v0.23.5](https://github.com/defenseunicorns/zarf/releases/tag/v0.24.2)
- Optional: A working Kubernetes cluster. e.g KinD, k3d, k3s, etc. If necessary, Zarf can be used to deploy a built-in k3s distribution.

## Build the package

```bash
$ make build
...
$ ls -l build/
total 2499764
-rw-r--r--. 1 user user 2559751131 Jan 23 08:24 zarf-package-big-bang-amd64.tar.zst
$ 
```

## Deploy the package

1. Download and deploy Zarf's init package.
```bash
$ zarf package deploy ~/Downloads/zarf-init-amd64.tar.zst --components git-server --confirm
```

Optionally, if a Kubernetes cluster is not installed, we can tell Zarf to install one for us:

```bash
zarf package deploy ~/Downloads/zarf-init-amd64.tar.zst --components k3s,git-server --confirm
```

2. Deploy the Big Bang package created in the Build step above:

```bash
zarf package deploy ./build/zarf-package-big-bang-amd64.tar.zst --components keycloak,authsvc --confirm
```

Check whether the deployment succeeded. If the deployment is successful, then you should see this message from the HelmRelease resource in the cluster.

``` bash
$ kubectl get helmrelease -A
NAMESPACE   NAME             AGE     READY   STATUS
bigbang     authservice      9m16s   True    Release reconciliation succeeded
bigbang     bigbang          9m28s   True    Release reconciliation succeeded
bigbang     istio            9m16s   True    Release reconciliation succeeded
bigbang     istio-operator   9m16s   True    Release reconciliation succeeded
bigbang     jaeger           9m16s   True    Release reconciliation succeeded
bigbang     keycloak         9m16s   True    Release reconciliation succeeded
bigbang     kiali            9m16s   True    Release reconciliation succeeded
bigbang     kyverno          9m16s   True    Release reconciliation succeeded
bigbang     loki             9m16s   True    Release reconciliation succeeded
bigbang     minio            9m16s   True    Release reconciliation succeeded
bigbang     minio-operator   9m16s   True    Release reconciliation succeeded
bigbang     monitoring       9m16s   True    Release reconciliation succeeded
bigbang     promtail         9m16s   True    Release reconciliation succeeded
$ kubectl get kustomization -A
NAMESPACE     NAME      AGE   READY   STATUS
flux-system   bigbang   23m   True    Applied revision: 1.54.0/74f7a52a33b8f912020fa69599dae1d75200c479
flux-system   podinfo   23m   True    Applied revision: 1.54.0/74f7a52a33b8f912020fa69599dae1d75200c479
```

## Access Keycloak and Podinfo endpoints

Make note of the IPs of Istio gateways representing passthrough and public gateways for Keycloak and Podinfo respectively. If DNS resolution of the IPs is enabled in the cloud provider, open the browser and connect to:
- https://keycloak.bigbang.dev/
- https://podinfo.big.bang.dev
