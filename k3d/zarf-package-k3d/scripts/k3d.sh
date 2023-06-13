#!/bin/bash
# Create k3d cluster named ${ZARF_K3D_CLUSTER_NAME}
#
# if it doesn't already exist

# Check if the cluster already exists
if k3d cluster list | grep -q "${ZARF_K3D_CLUSTER_NAME}"; then
  echo "Cluster already exists"
else
    k3d cluster create \
    --k3s-arg "--disable=traefik@server:0" \
    --k3s-arg "--disable=metrics-server@server:0" \
    --port 443:443@loadbalancer \
    --port 80:8080@loadbalancer
    ${ZARF_K3D_CLUSTER_NAME}
fi
# Switch to the k3d context
k3d kubeconfig merge ${ZARF_K3D_CLUSTER_NAME}
