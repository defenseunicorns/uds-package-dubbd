#!/bin/bash
# Create k3d cluster named ${ZARF_K3D_CLUSTER_NAME}
#
# if it doesn't already exist

[[ "$#" -ne 1 ]] && echo "ERROR: must specify K3D_CLUSTER_NAME in single arg" && exit 1
K3D_CLUSTER_NAME=$1
if k3d cluster list | grep -q "${K3D_CLUSTER_NAME}"; then
  echo "Cluster already exists"
else
    k3d cluster create \
    --k3s-arg "--disable=traefik@server:*" \
    --k3s-arg "--disable=metrics-server@server:*" \
    --k3s-arg "--disable=servicelb@server:*" \
    --port 443:443@loadbalancer \
    --port 80:8080@loadbalancer \
    ${K3D_CLUSTER_NAME}
fi
# Write or merge kubeconfig(s) from k3d cluster(s) into kubeconfig file,
# and switch kubectl to this context
k3d kubeconfig merge -s ${K3D_CLUSTER_NAME}
