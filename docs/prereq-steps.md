# DUBBD Prerequisites

## ZARF

You need Zarf installed locally with a minimum version of [v0.30.1](https://github.com/defenseunicorns/zarf/releases/tag/v0.30.1)

## Kubernetes Cluster (Optional)

DUBBD is designed to run on a kubernetes cluster (v1.26+), which means you will either need a local cluster (e.g k3d, k3s, KinD, minikube ([Zarf can be used to deploy a built-in k3s distribution](https://docs.zarf.dev/docs/deploy-a-zarf-package/deployment-ui#deploy-a-k3s-cluster-with-the-init-package)) or an external one to which Zarf can connect.

## Working Kube Context

After you've created a cluster, make sure it's accessible via the current kube context i.e. (`zarf tools kubectl get nodes` <-- this command works)
