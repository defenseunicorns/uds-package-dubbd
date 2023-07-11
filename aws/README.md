# Defense Unicorns Big Bang Distro for AWS (DUBBD-AWS)

## Prerequisites

- Zarf CLI installed locally. Minimum version of `v0.27.1`
- AWS EKS cluster -- K8s v1.26+
- AWS EKS cluster has Zarf init package deployed (with `git-server` component)
- Local K8s context is pointing to the above cluster
- Existing AWS S3 bucket with a Terraform state file present and AWS DynamoDB table for state locking
- AWS Route53 hosted DNS zone (matching the `domain` that will be used in the DUBBD-AWS configuration)
- A `~/.docker/config.json` file. Zarf [currently requires this](https://github.com/defenseunicorns/zarf/issues/1795) to deploy from an OCI registry

## Build the package (optional)
This section describes how to build a DUBBD-AWS package locally. If you just want to deploy DUBBD-AWS skip this step!

```bash
# Login to the registry
set +o history
export REGISTRY1_USERNAME="YOUR-USERNAME-HERE"
export REGISTRY1_PASSWORD="YOUR-PASSWORD-HERE"
echo $REGISTRY1_PASSWORD | zarf tools registry login registry1.dso.mil --username $REGISTRY1_USERNAME --password-stdin
set -o history

# Create the zarf package
zarf package create --architecture amd64 --confirm

# (Optionally) Publish package to an OCI registry
```

## Configure DUBBD-AWS
The recommended way to configure DUBBD-AWS is via a `zarf-config.yaml` file located in the same directory that you will be performing the deploy. The available `zarf-config.yaml` configurations are shown below. 
> Note the keys that are not commented out are **required** to deploy DUBBD-AWS. 

```yaml
package:  
  deploy:
    set:
      # -- Domain name for the EKS cluster
      domain: bigbang.dev
      # -- TLS key
      key_file: bigbang.dev.key
      # -- TLS cert
      cert_file: bigbang.dev.cert
      # -- Name of the EKS cluster
      name: "big-bang-aws"
      # -- Name of existing Terraform state bucket
      state_bucket_name: uds-dev-state-bucket
      # -- Key path to Terraform state file within the bucket
      state_key: tfstate/dev/uds-dev-state-bucket.tfstate
      # -- Name of DynamoDB table used for Terraform state locking
      state_dynamodb_table_name: uds-dev-state-dynamodb
      # -- AWS region
      region: us-west-2
      # -- Provision a private/internal load balancer for the admin ingress gateway, if false a public load balancer will be provisioned
      private_admin_lb: true
      # -- Provision a private/internal load balancer for the tenant ingress gateway, if false a public load balancer will be provisioned
      private_tenant_lb: true
      # -- If set to true, force delete all resources on removal (i.e. loki S3 bucket, PVCs, etc)
      ephemeral: false
      # -- If set to true, delete the S3 bucket and corresponding KMS key associated with the Loki bucket. Overrides ephemeral setting.
      #loki_force_destroy: "true"
```

## Deploy the package

Once all of the prereqs are met and the `zarf-config.yaml` has been configured:
```bash
# To deploy from OCI (recommended)
zarf package deploy oci://ghcr.io/defenseunicorns/packages/dubbd-aws:<VERSION>-amd64 \
  --oci-concurrency=15 \
  --confirm
```
Note that package versions can be found in the [Defense Unicorns GHCR repo](https://github.com/defenseunicorns/uds-package-dubbd/pkgs/container/packages%2Fdubbd-aws).


If developing locally:
```bash
zarf package deploy --confirm zarf-package-dubbd-aws-*.tar.zst
```

## Additional Information

When running Big Bang on AWS, Loki is configured to use S3 for storage for better persistance.  The Zarf package for DUBBD-AWS is created by overlaying a new loki values file on top of the existing DUBBD zarf file via:

```yaml
- name: bigbang
  required: true
  import:
    path: ../defense-unicorns-distro
  extensions:
    bigbang:
      version: "###ZARF_PKG_VAR_BIGBANG_VERSION###"
      valuesFiles:
      - values/aws-loki.yaml
```

In order for this configuration to work cleanly, DUBBD-AWS also provisions an S3 bucket from our [IaC Repo](https://github.com/defenseunicorns/terraform-aws-uds-s3) that provides encryption at rest and a role to access the S3 bucket that gets used by Loki via [IRSA](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html).

## DUBBD upgrade

### Before upgrading

It is important to take a few steps before the upgrade to confirm you are on a supported upgrade path and that your DUBBD deployment is in a healthy state.

#### Get current deployed version

Zarf does not expose the current version of your DUBBD deployment, but this may be an option in the future (see [this issue](https://github.com/defenseunicorns/zarf/issues/1797) to track the progress of that functionality). 

- Get the DUBBD version deployed with `kubectl`+`jq`

```console
zarf tools kubectl get secret -n zarf zarf-package-dubbd-aws -o go-template="{{ .data.data | base64decode }}" | jq -r '.data.metadata.version'
```

- If you don't have access to `jq` run this alternative command and review the output to find the `data.metadata.version` value manually

```console
zarf tools kubectl get secret -n zarf zarf-package-dubbd-aws -o go-template="{{ .data.data | base64decode }}"
```

- Get the corresponding Big Bang version that is deployed

```console
zarf tools kubectl get helmrelease -n bigbang bigbang -o jsonpath='{.status.lastAppliedRevision}'`
```

#### Determine target upgrade version

It's best to stay up to date with the latest DUBBD version to ensure you have the latest security patches for applications as well as the latest features and fixes from DUBBD. Typically your upgrade should target the latest patch version for a given minor version, e.g. `0.2.4` and not `0.2.3`.  Supported (and recommended) upgrade paths can be reviewed in the matrix below - in general you can jump multiple patch versions but only a single major/minor patch version.

| Current Version | Supported Upgrade Version(s) | Recommended Upgrade Version |
|-|-|-|
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
