#!/bin/bash

# Run your command and get the output
output="###ZARF_VAR_OUTPUT###"

echo ${output}
# Extract the Server Version Major and Minor versions using grep and cut
server_version=$(echo "$output" | grep -o "Server Version:.*" | cut -d" " -f3)
echo "server_version_line: ${server_version}"
server_major_version=$(echo "$server_version" | cut -d"." -f1)
server_minor_version=$(echo "$server_version" | cut -d"." -f2)

# Define a supported version
supported_major_version="v1"
supported_minor_version="26"

echo "Server Major: ${server_major_version}"
echo "Server Minor: ${server_minor_version}"

# Check if the Server Version is supported
if [[ "$server_major_version" == "$supported_major_version" ]] && (( "$server_minor_version" >= "$supported_minor_version" )); then
  echo "Server version is supported"
  exit 0
else
  echo "Server version is not supported"
  exit 1
fi
