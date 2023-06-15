# `k3d-local` Zarf Package 

Zarf package that deploys a k3d cluster with metallb.

## Creation

Confirm your desired values are in [`zarf-config.yaml`](./zarf-config.yaml)[^1], then run:


```bash
zarf package create --confirm
```

## Deployment

```bash
zarf package deploy --confirm zarf-package-k3d-local-<ARCH>-<ZARF_VERSION>.tar.zst 
```

e.g. `zarf package deploy --confirm zarf-package-k3d-local-amd64-v0.27.0.tar.zst`

[^1]: Noting that only global `zarf` options may be declared, and that `--confirm` is not a global option.
