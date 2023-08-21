#!/bin/bash

# Run your command and get the output
output="###ZARF_VAR_OUTPUT###"

# Extract the Server Version Major and Minor versions using grep and cut
server_version=$(echo "$output" | grep -o "Server Version:.*" | cut -d" " -f3)
server_major_version=$(echo "$server_version" | cut -d"." -f1)
server_minor_version=$(echo "$server_version" | cut -d"." -f2)

# Define a supported version
supported_major_version="v1"
supported_minor_version="26"

# Check if the Server Version is supported
if [[ "$server_major_version" == "$supported_major_version" ]] && (( "$server_minor_version" >= "$supported_minor_version" )); then
  echo "Server version is supported"
else
  echo "Server version is not supported"
  echo "Please update your cluster to a minimum Kubernetes version of ${supported_major_version}.${supported_minor_version}"
  exit 1
fi
# system has a kubecontext set
if [ $(./zarf tools kubectl config view | egrep ^current-context | awk '{print $2}') == '""' ]; then 
  echo "No kubecontext has been set. Please ensure that a valid context is configured before proceeding."
  exit 1
fi

# k8s cluster is healthy per kubectl get --raw='/readyz?verbose'
if ! [ "$(./zarf tools kubectl get --raw='/readyz' 2> /dev/null )" == 'ok' ]; then
  ./zarf tools kubectl get --raw='/readyz?verbose'
  echo Kubernetes cluster is not healthy! Aborting...
  exit 1
fi

# zarf init was completed (with git-server component)
if [ $(./zarf tools kubectl get secret -n zarf zarf-state >/dev/null 2>&1 || echo false) ]; then
  echo Zarf has not been initialized. Please run zarf init and try again.
  exit 1
fi

if ! [ $(./zarf tools kubectl get po -n zarf zarf-gitea-0 -ojsonpath='{.status.containerStatuses[*].ready}' 2>/dev/null) ]; then
  echo Gitea is not running. Please ensure that gitea is configured properly.
  exit 1
fi  

# known misconfigurations
