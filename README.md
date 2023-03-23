# zarf-package-big-bang

Pre-built Zarf Package of [DoD-Platform-One/big-bang](https://github.com/DoD-Platform-One/big-bang) configured for production use by Defense Unicorns.

## Prerequisites
- Zarf is installed. Current version used is: [v0.25.0](https://github.com/defenseunicorns/zarf/releases/tag/v0.25.0)
- Optional: A working Kubernetes cluster. e.g KinD, k3d, k3s, etc. If necessary, Zarf can be used to deploy a built-in k3s distribution.

## Build the package

```bash
$ cd defense-unicorns-distro
$ zarf package create --confirm
....
```

## Deploy the package

### Prereqs

Assumption is that there's a Kubernetes cluster that's already had `zarf init` run on it.

### Install Big Bang

2. Deploy the Big Bang package created in the Build step above:

```bash
zarf package deploy zarf-package-big-bang-amd64-*.tar.zst --confirm
```

Check whether the deployment succeeded. If the deployment is successful, then you should see this message from the HelmRelease resource in the cluster.

``` bash
$ kubectl get helmrelease -A
NAMESPACE   NAME             AGE     READY   STATUS
bigbang     bigbang          9m28s   True    Release reconciliation succeeded
bigbang     istio            9m16s   True    Release reconciliation succeeded
bigbang     istio-operator   9m16s   True    Release reconciliation succeeded
bigbang     jaeger           9m16s   True    Release reconciliation succeeded
bigbang     kiali            9m16s   True    Release reconciliation succeeded
bigbang     kyverno          9m16s   True    Release reconciliation succeeded
bigbang     loki             9m16s   True    Release reconciliation succeeded
bigbang     minio            9m16s   True    Release reconciliation succeeded
bigbang     minio-operator   9m16s   True    Release reconciliation succeeded
bigbang     monitoring       9m16s   True    Release reconciliation succeeded
bigbang     promtail         9m16s   True    Release reconciliation succeeded
```
