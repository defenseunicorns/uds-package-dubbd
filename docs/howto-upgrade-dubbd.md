## DUBBD upgrade

### Before upgrading

It is important to take a few steps before the upgrade to confirm you are on a supported upgrade path and that your DUBBD deployment is in a healthy state.

#### Get current deployed version

- Get the DUBBD version deployed

```console
zarf package list
```

- Get the corresponding Big Bang version that is deployed

```console
zarf tools kubectl get helmrelease -n bigbang bigbang -o jsonpath='{.status.lastAppliedRevision}'`
```

#### Determine target upgrade version

It's best to stay up to date with the latest DUBBD version to ensure you have the latest security patches for applications as well as the latest features and fixes from DUBBD. Typically your upgrade should target the latest patch version for a given minor version, e.g. `0.2.4` and not `0.2.3`. In general you can jump multiple patch versions but only a single major/minor patch version.

Example Upgrade Matrix:
| Current Version | Supported Upgrade Version(s) | Recommended Upgrade Version |
| --------------- | ---------------------------- | --------------------------- |
| 0.2.\* | 0.2.\* | Latest 0.2.x patch version |
| 0.1.\* | 0.1.\*, 0.2.\* | Latest 0.2.x patch version |

If you are not on a supported upgrade path, you will need to review the release notes and test the intended upgrade path on your own. If you have fallen behind several versions we recommend doing consecutive upgrades of the intermediate versions (ex: `0.1.0` -> `0.2.0` -> `0.3.0`) or at minimum testing the upgrade jump in a staging environment.

#### Verify DUBBD health

Prior to upgrading you should confirm that your current deployment is healthy. A few basic checks are included below:

- Confirm that all helmreleases have reconciled

```console
## The `STATUS` column should show `Release reconciliation succeeded` for all helmreleases
zarf tools kubectl get hr -n bigbang -l app.kubernetes.io/part-of=bigbang`
```

- Confirm that all flux pods are running

```console
## Pods should have a `STATUS` of `Running` and show as `READY` `1/1`
zarf tools kubectl get pod -n flux-system
```

- Confirm that all DUBBD pods are running

```console
## This will output all pods in all namespaces, check for `STATUS` of `Running` and `READY` `x/x`
zarf tools kubectl get pod -A
```

- (DUBBD AWS Specific) Verify AWS resources exist (S3 bucket for Loki, Load Balancers for Istio): This can be confirmed via your AWS console or CLI access

### Upgrade Steps

Follow the same steps as used for initial deployment.

### Post upgrade validation

After the upgrade is complete, here are some recommended validation activities:

- Confirm the deployed DUBBD version is correct

```console
zarf package list
```

- Perform the same steps outlined in [Verify DUBBD health](#verify-dubbd-health)
- Test BigBang functionality works (ex: Grafana, Kiali, Neuvector, Tempo, etc)

### (Optional) Rollback

If a rollback is deemed necessary, these are the various options:

#### OPTION 1: Deploy a previous working version of the DUBBD package

- Grab the version of the deployed DUBBD package

```console
zarf package list
```

- Prep the zarf-config.yaml for use with the previous DUBBD version
- Deploy previous version of DUBBD

e.g. for DUBBD AWS

```console
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd-aws:(PREVIOUS-VERSION)-amd64
```

#### OPTION 2: Remove DUBBD package and re-deploy a previous working version

- Grab the name and version of the deployed DUBBD package

```console
zarf package list'
```

- Remove the DUBBD package (execute command from same directory used to deploy)

```console
zarf package remove <name of deployed DUBBD> --confirm
```

- Prep the zarf-config.yaml for use with the previous DUBBD version
- Deploy previous version of DUBBD

e.g. for DUBBD AWS

```console
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd-aws:(PREVIOUS-VERSION)-amd64
```

#### OPTION 3: Helm rollback of the DUBBD helm releases (Terraform needs to be handled separately)

- Get the DUBBD managed umbrella helm chart name

```sh
export DUBBD_HELM_RELEASE=$(helm ls -n bigbang -f 'zarf-[\w\[\]]+' --no-headers --short)
export DUBBD_FLUX_HELM_RELEASE=$(helm ls -n flux-system -f 'zarf-[\w\[\]]+' --no-headers --short)
```

- View the helm history of the helm releases

```sh
helm history -n bigbang ${DUBBD_HELM_RELEASE}
helm history -n flux-system ${DUBBD_FLUX_HELM_RELEASE}
```

- Roll back to previous helm chart version

```sh
helm rollback -n bigbang ${DUBBD_HELM_RELEASE}
helm rollback -n flux-system ${DUBBD_FLUX_HELM_RELEASE}
```

- Check the updated helm history of the DUBBD managed umbrella helm release name

```sh
helm history -n bigbang ${DUBBD_HELM_RELEASE}
helm history -n flux-system ${DUBBD_FLUX_HELM_RELEASE}
```
