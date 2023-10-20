# Developer Notes

This document provides more granular guidance on how to develop, deploy, and test code changes to DUBBD.

### Defense Unicorns Big Bang Distro for AWS (DUBBD-AWS)

This section outlines the development cycle to build, deploy, and test DUBBD-AWS.

#### Build & deploy DUBBD-AWS & AWS resources

The steps below mimic what is performed as part of the DUBBD CI process.

##### Stand up AWS resources

First authenticate to AWS (verify the right region is set), and create the following pre-requisite resources:

- AWS S3 bucket to store state
- AWS DynamoDB table for state locking

Note the created resources for later use by these Zarf variables:

```console
state_bucket_name="YOURSTATEBUCKETNAMEHERE"
state_dynamodb_table_name="YOURDYNAMODBTABLENAMEHERE"
region="YOURREGIONHERE"
```

Create an EKS cluster:

```console
# change to the CI eksctl dir
cd .github/test-infra/eks

# if needed, modify the AWS region in the eksctl config
vi config.yaml
##metadata:
##  name: "###ZARF_VAR_CLUSTER_NAME###"
##  region: us-west-2  #<-- change this to match region used for state resources

# run zarf package create
zarf package create . --confirm

# deploy the package with the desired cluster name
zarf package deploy zarf-package-*.tar.zst \
  --set cluster_name="YOURCLUSTERNAMEHERE" \  # <-- note the cluster name used
  --confirm
```

Zarf init the EKS cluster:

```console
# confirm client is pointing at the right EKS cluster
zarf tools kubectl config current-context

# run zarf init
zarf init -a amd64 --components=git-server --confirm
```

Deploy remaining AWS resources needed for DUBBD-AWS:

```console
# change to the CI-DUBBD-IAC-AWS dir
cd .github/test-infra/ci-dubbd-iac-aws

# run zarf package create
zarf package create . --confirm

# deploy the package with the appropriate zarf variable values
zarf package deploy zarf-package-*.tar.zst \
  --set ephemeral="true" \
  --set name="YOURCLUSTERNAMEHERE" \
  --set region="YOURREGIONHERE" \
  --set state_bucket_name="YOURSTATEBUCKETNAMEHERE" \
  --set state_key="tfstate/dev/install/YOURCLUSTERNAMEHERE-dubbd-aws.tfstate" \
  --set state_dynamodb_table_name="YOURDYNAMODBTABLENAMEHERE" \
  --confirm

# source the setenv output from the IAC deploy
. ./setenv-dubbd-package.sh

# verify the env var from setenv looks correct
env | grep ZARF_PACKAGE_DEPLOY_SET
```

##### Build and Deploy

```console
# change to the DUBBD-AWS dir
cd aws/dubbd-aws

# verify the env var from setenv looks correct
env | grep ZARF_PACKAGE_DEPLOY_SET

# deploy the package with the appropriate zarf variable values
zarf package deploy zarf-package-\*.tar.zst \
 --set domain="bigbang.dev" \
 --set key_file="bigbang.dev.key" \
 --set cert_file="bigbang.dev.cert" \
 --set private_admin_lb="true" \
 --set private_tenant_lb="true" \
 --confirm

```

#### Uninstall DUBBD-AWS & AWS resources

Remove DUBBD-AWS from EKS:

```console
# change to the DUBBD-AWS dir
cd .github/aws/dubbd-aws

# get list of zarf packages installed on the cluster
zarf package list

# run zarf package remove
zarf package remove zarf-package-*.tar.zst --confirm

# confirm DUBBD-AWS was removed
zarf package list
```

Tear down AWS resources created for DUBBD-AWS:

```console
# change to the CI DUBBD IAC AWS dir
cd .github/test-infra/ci-dubbd-iac-aws

# run zarf package remove
zarf package remove zarf-package-*.tar.zst --confirm
```

Tear down EKS cluster:

```console
# change to the CI eksctl dir
cd .github/test-infra/eks

# run zarf package remove
zarf package remove zarf-package-*.tar.zst --confirm
```
