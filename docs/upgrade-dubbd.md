## DUBBD upgrade

### Before upgrading

It is important to take a few steps before the upgrade to confirm you are on a supported upgrade path and that your DUBBD deployment is in a healthy state.

#### Get current deployed version

Zarf does not expose the current version of your DUBBD deployment, but this may be an option in the future (see [this issue](https://github.com/defenseunicorns/zarf/issues/1797) to track the progress of that functionality).

- Get the DUBBD version deployed

```console
zarf package list
```

- Get the corresponding Big Bang version that is deployed

```console
zarf tools kubectl get helmrelease -n bigbang bigbang -o jsonpath='{.status.lastAppliedRevision}'`
```

#### Determine target upgrade version

It's best to stay up to date with the latest DUBBD version to ensure you have the latest security patches for applications as well as the latest features and fixes from DUBBD. Typically your upgrade should target the latest patch version for a given minor version, e.g. `0.2.4` and not `0.2.3`. Supported (and recommended) upgrade paths can be reviewed in the matrix below - in general you can jump multiple patch versions but only a single major/minor patch version.

| Current Version | Supported Upgrade Version(s) | Recommended Upgrade Version |
| --------------- | ---------------------------- | --------------------------- |
| 0.2.\*          | 0.2.\*                       | Latest 0.2.x patch version  |
| 0.1.\*          | 0.1.\*, 0.2.\*               | Latest 0.2.x patch version  |

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

- Verify AWS resources exist (S3 bucket for Loki, Load Balancers for Istio): This can be confirmed via your AWS console or CLI access

### Upgrade Steps

Follow the same steps as used for initial deployment from the [configure DUBBD](#configure-dubbd-aws) and [deploy the package](#deploy-the-package) sections.

### Post upgrade validation

After the upgrade is complete, here are some recommended validation activities:

- Confirm the deployed DUBBD version is correct

```console
# zarf tools kubectl get secret -n zarf zarf-package-dubbd-aws -o go-template="{{ .data.data | base64decode }}" | jq -r '.data.metadata.version'
```

- Perform the same steps outlined in [Verify DUBBD health](#verify-dubbd-health)
- Test BigBang functionality works (ex: Grafana, Kiali, Neuvector, Tempo, etc)

### (Optional) Rollback

If a rollback is deemed necessary, these are the various options:

#### OPTION 1: Deploy a previous working version of the DUBBD package

- Grab the version of the deployed DUBBD package

```console
zarf tools kubectl get secret -n zarf zarf-package-dubbd-aws -o go-template="{{ .data.data | base64decode }}" | jq -r '.data.metadata.version'
```

- Prep the zarf-config.yaml for use with the previous DUBBD version
- Deploy previous version of DUBBD

```console
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd-aws:(PREVIOUS-VERSION)-amd64
```

#### OPTION 2: Remove DUBBD package and re-deploy a previous working version

- Grab the version of the deployed DUBBD package

```console
zarf tools kubectl get secret -n zarf zarf-package-dubbd-aws -o go-template="{{ .data.data | base64decode }}" | jq -r '.data.metadata.version'
```

- Remove the DUBBD package (execute command from same directory used to deploy)

```console
zarf package remove dubbd-aws --confirm
```

- Prep the zarf-config.yaml for use with the previous DUBBD version
- Deploy previous version of DUBBD

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

## Troubleshooting issues

- If the DUBBD deploy fails with errors the output should have run commands like these

```console
zarf tools kubectl describe helmrelease -n bigbang $hr
zarf tools kubectl get nodes -o wide
zarf tools kubectl get hr -n bigbang
zarf tools kubectl get gitrepo -n bigbang
zarf tools kubectl get pods -A
ERROR:  Failed to deploy package: unable to deploy all components in this Zarf Package: unable to run
        component success action: command "Big Bang Helm Release `Failed-Helm-Release-Name` to be
        ready" failed after 0 retries
```

- Confirm `zarf init` was performed and components are in-place / healthy

```console
zarf tools kubectl get mutatingwebhookconfigurations zarf
zarf tools kubectl get all -n zarf
```

- Confirm sufficient capacity on the cluster

```console
## Look for events and info under "Allocated resources:"
zarf tools kubectl describe node
zarf tools kubectl top node
```

- Confirm storage is being allocated as desired

```console
zarf tools kubectl get pv,pvc -A
```

- Check helm releases

```console
helm ls -A
helm history -n bigbang <helm-release-name>
helm get all -n bigbang <helm-release-name>
```

- Check Istio is properly configured and logs for errors

```console
zarf tools kubectl get svc -n istio-system
zarf tools kubectl logs -n istio-system deploy/admin-ingressgateway --all-containers=true -f
zarf tools kubectl logs -n istio-system deploy/tenant-ingressgateway --all-containers=true -f
```

- Check the zarf debug log file for additional information

```console
ls -ldrta /tmp/zarf*
export ZARF_LOG_FILE=/tmp/<zarf-log-name>.log
ansi2txt < ${ZARF_LOG_FILE} | col -b | view -
```