# Troubleshooting issues

If the DUBBD deploy fails with errors the output should have run commands like these

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

Confirm `zarf init` was performed and components are in-place / healthy

```console
zarf tools kubectl get mutatingwebhookconfigurations zarf
zarf tools kubectl get all -n zarf
```

Confirm sufficient capacity on the cluster

```console
## Look for events and info under "Allocated resources:"
zarf tools kubectl describe node
zarf tools kubectl top node
```

Confirm storage is being allocated as desired

```console
zarf tools kubectl get pv,pvc -A
```

Check helm releases

```console
helm ls -A
helm history -n bigbang <helm-release-name>
helm get all -n bigbang <helm-release-name>
```

Check Istio is properly configured and logs for errors

```console
zarf tools kubectl get svc -n istio-system
zarf tools kubectl logs -n istio-system deploy/admin-ingressgateway --all-containers=true -f
zarf tools kubectl logs -n istio-system deploy/tenant-ingressgateway --all-containers=true -f
```

Check the zarf debug log file for additional information

```console
ls -ldrta /tmp/zarf*
export ZARF_LOG_FILE=/tmp/<zarf-log-name>.log
ansi2txt < ${ZARF_LOG_FILE} | col -b | view -
```
