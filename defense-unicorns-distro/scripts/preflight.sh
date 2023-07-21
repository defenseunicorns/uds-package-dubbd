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
  exit 0
else
  echo "Server version is not supported"
  echo "Please update your cluster to a minimum Kubernetes version of ${supported_major_version}.${server_minor_version}"
  exit 1
fi
