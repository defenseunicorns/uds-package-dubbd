# Admin Interfaces
There are several components in DUBBD that offer a web interface. Those services are exposed behind an "Administrator" Istio `Gateway` resource. When you deploy DUBBD, it will automatically create secure default credentials for those interfaces. Those credentials are stored in a Kubernetes Secret in the `zarf` namespace called `dubbd-admin-interface-credentials`. This secret is the source of truth for all passwords for an admin interface. 

See the instructions below for querying the passwords for each component. 

## Grafana
```bash
kubectl get secret -n zarf dubbd-admin-interface-credentials -o go-template='{{index .data "grafana-password" | base64decode}}'
```
## NeuVector
```bash
kubectl get secret -n zarf dubbd-admin-interface-credentials -o go-template='{{index .data "neuvector-password" | base64decode}}'
```