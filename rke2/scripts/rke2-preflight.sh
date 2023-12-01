#!/bin/bash
# Retrieve output from test commands as zarf variables
has_velero_creds="###ZARF_VAR_HAS_VELERO_CREDENTIALS###"

# Velero bucket is configured
if [ -z "${ZARF_VAR_VELERO_S3_BUCKET}" ] || [ -z "${ZARF_VAR_VELERO_S3_AWS_REGION}" ]; then
  echo "VELERO_S3_BUCKET and VELERO_S3_AWS_REGION must be provided when VELERO_ENABLED is 'true'. Aborting..."
  exit 1
fi

# Velero bucket credentials exist
if [ -z "${ZARF_VAR_VELERO_AWS_ROLE}" ] && [ "$has_velero_creds" == "false" ]; then
  echo "Either VELERO_AWS_ROLE must be set, or the credentials secret `velero-bucket-credentials` must exist in the `velero` namespace. Aborting..."
  exit 1
fi