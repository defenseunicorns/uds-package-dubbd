#!/bin/bash

# Retrieve output from test commands as zarf variables
cluster_version="###ZARF_VAR_CLUSTER_VERSION###"
has_kubeconfig="###ZARF_VAR_HAS_KUBECONFIG###"
is_healthy="###ZARF_VAR_IS_HEALTHY###"
has_init="###ZARF_VAR_HAS_INIT###"
gitea_running="###ZARF_VAR_GITEA_RUNNING###"

# Extract the Server Major and Minor versions using cut
server_major_version=$(echo "$cluster_version" | cut -d"." -f1)
server_minor_version=$(echo "$cluster_version" | cut -d"." -f2)

# Define a supported version
supported_major_version="v1"
supported_minor_version="26"

# system has a kubecontext set
if [ "$has_kubeconfig" == "false" ]; then
  echo "No kubecontext has been set. Please ensure that a valid context is configured before proceeding."
  exit 1
fi

# k8s cluster is healthy per kubectl get --raw='/readyz?verbose'
if [ "$is_healthy" == "false" ]; then
  ./zarf tools kubectl get --raw='/readyz?verbose'
  echo "Kubernetes cluster is not healthy! Aborting..."
  exit 1
fi

# Check if the Server Version is supported
if [[ "$server_major_version" == "$supported_major_version" ]] && (( "$server_minor_version" >= "$supported_minor_version" )); then
  echo "Server version is supported"
else
  echo "Server version is not supported"
  echo "Please update your cluster to a minimum Kubernetes version of ${supported_major_version}.${supported_minor_version}"
  exit 1
fi

# zarf init was completed (with git-server component)
if [ "$has_init" == "false" ]; then
  echo "Zarf has not been initialized. Please run zarf init and try again."
  exit 1
fi

if [ "$gitea_running" -lt 1 ]; then
  echo "Gitea is not running. Please ensure that gitea is configured properly."
  exit 1
fi

# known misconfigurations
