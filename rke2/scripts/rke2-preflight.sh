#!/bin/bash

# Velero bucket is configured
if [ -z "${ZARF_VAR_VELERO_BUCKET}" ] ; then
  echo "VELERO_BUCKET must be provided. Aborting..."
  exit 1
fi

# Velero bucket region is configured
if [ -z "${ZARF_VAR_VELERO_BUCKET_REGION}" ]; then
  echo "VELERO_BUCKET_REGION must be provided. Aborting..."
  exit 1
fi

# Velero bucket key is configured
if [ -z "${ZARF_VAR_VELERO_BUCKET_KEY}" ]; then
  echo "VELERO_BUCKET_KEY must be provided. Aborting..."
  exit 1
fi

# Velero bucket key secret is configured
if [ -z "${ZARF_VAR_VELERO_BUCKET_KEY_SECRET}" ]; then
  echo "VELERO_BUCKET_KEY_SECRET must be provided. Aborting..."
  exit 1
fi
