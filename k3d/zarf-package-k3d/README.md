# Zarf Package K3d

Zarf package that deploys a k3d cluster

## Creation

Confirm your desired values are in [`zarf-config.yaml`](./zarf-config.yaml)[^1], then run:


```bash
zarf package create --confirm
```

## Deployment

```bash
zarf package deploy --confirm
```

[^1]: Noting that only global `zarf` options may be declared, and that `--confirm` is not a global option.
