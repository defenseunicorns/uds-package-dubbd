#!/bin/bash

CLUSTER_NAME=dubbd

# Check if the cluster already exists
if k3d cluster list | grep -q "$CLUSTER_NAME"; then
  echo "Cluster already exists"
else
    # Local volume for data is tied to my implementation
    k3d cluster create \
    --k3s-arg "--disable=traefik@server:0" \
    --k3s-arg "--disable=metrics-server@server:0" \
    --port 443:443@loadbalancer \
    --port 80:8080@loadbalancer \
    --image ghcr.io/runyontr/packages/rancher/k3s:v1.25.7-k3s1-cuda \
    --gpus=2 \
    dubbd
fi

# Switch to the k3d context
k3d kubeconfig merge $CLUSTER_NAME
