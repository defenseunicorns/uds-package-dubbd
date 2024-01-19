# DUBBD Prerequisites

## Zarf

You need Zarf installed locally with a minimum version of [v0.32.1](https://github.com/defenseunicorns/zarf/releases/tag/v0.32.1)

[Install zarf](https://docs.zarf.dev/docs/getting-started/#installing-zarf)

## Docker

Docker is required by a couple of the other pre-requisites -- mainly zarf and a local k8s cluster.

(Does Zarf work with Podman?)

[Install docker](https://docs.docker.com/install/https://docs.docker.com/install/)

## Kubectl (Optional)

You don't have to have kubectl installed locally because `zarf` builds the latest stable release tag of the [upstream k8s.io cli and cmd sources](https://github.com/defenseunicorns/zarf/blob/ee4da6a938811e3da1801dac284dd2b2e8ee665f/src/cmd/tools/kubectl.go#L11), which can then be used as `zarf tools kubectl`.

But if you prefer the standalone kubectl: [Install kubectl](https://kubernetes.io/docs/tasks/tools/#kubectlhttps://kubernetes.io/docs/tasks/tools/#kubectl)

## Kubernetes Cluster

DUBBD is designed to run on a kubernetes cluster (v1.26+), which means you will either need a local cluster (e.g k3d, k3s, rke2 etc...) or an external one (e.g eks) to which Zarf can connect.

DUBBD is officially tested against the following clusters. Any other tools (e.g. KinD and minikube) will most likely work with DUBBD but are not guaranteed.

- [Install k3d](https://k3d.io/v5.5.1/#installation)
- [Install k3s](https://docs.k3s.io/installation)
  - [Zarf can be used to deploy a built-in k3s distribution](https://docs.zarf.dev/docs/deploy-a-zarf-package/deployment-ui#deploy-a-k3s-cluster-with-the-init-package)
- [Install RKE2](https://docs.rke2.io/install/methods)

## Working Kube Context

Whether your cluster is local or external, make sure the kube context is set correctly and access to the cluster is working via e.g `zarf tools kubectl get nodes`.
