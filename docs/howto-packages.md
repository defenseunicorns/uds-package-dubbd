# How to Build and Deploy Packages

## [**Prereq steps**](prereq-steps.md)

## Setup Auth

1. Gain Access to GitHub Container Registry (`ghcr.io`)
   1. Login to your GitHub Account.
   1. [Create a (classic) personal access token](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic) user scoped with `read/write/delete:packages` _as needed_, and store in a secure location.
      1. _Note: use cases that don't publish packages should remove `write:packages` from the access token's scope below._
1. Gain Access to Iron Bank Harbor (`registry1.dso.mil`)
   1. Create account at [Platform One's DevSecOps Collaboration Workspace (https://login.dso.mil)](https://login.dso.mil).
   1. Login to [Harbor (https://registry1.dso.mil)](https://registry1.dso.mil) (SSO Option) with same creds (accepting user agreements).
   1. In upper right corner, click _<your username>_ --> _User Profile_, then click the _Copy_ icon next to _CLI secret_, and store in a secure and accessible location.
1. Validate AuthN to Container Registries

   1. On your machine, run:

   ```bash
   set +o history  # don't let these secrets end up in plain text shell history
   export GITHUB_USER=<github username>
   export GITHUB_PASS=<github container registry personal access token>
   export IRONBANK_USER=<dso.mil username>
   export IRONBANK_PASS=<iron bank cli secret>
   echo $GITHUB_PASS | zarf tools registry login ghcr.io --username $GITHUB_USER --password-stdin
   echo $IRONBANK_PASS | zarf tools registry login registry1.dso.mil --username $IRONBANK_USER --password-stdin
   set -o history
   ```

   _(Optional)_ Secure Container Registry Secrets with Local Credential Store

   1. [Install and configure a credential store for docker login](https://docs.docker.com/engine/reference/commandline/login/#credentials-store)
   1. Re-validate docker/zarf authN using the credential store configured in `~/.docker/config.json`

## Clone Repo

From the desired directory on your machine, run:

```bash
git clone https://github.com/defenseunicorns/uds-package-dubbd.git
```

## Create From Package Directory

There are several flavors of DUBBD you can create (i.e dubbd, dubbd-aws, dubbd-k3d). Each version is derived from a zarf.yaml found in a package sub-directory. To create one of these packages:

1. Change directory to locally cloned DUBBD repo

   e.g.

```bash
cd /repos/uds-package-dubbd
```

2. Change to desired DUBBD package directory

   e.g.

```bash
   # cd aws/dubbd-aws
   # cd defense-unicorns-distro
   # cd k3d
   # cd rke2
```

3. Create Package

```bash
zarf package create --confirm
```

> **Note**
>
> Some packages might have more specific directions in their README.md for building.

If the create succeeds you should see a .zst file in the same directory.

e.g `k3d/zarf-package-dubbd-k3d-amd64-0.9.1.tar.zst`

## Deploy Package

You can then deploy that package to your cluster.

```bash
zarf package deploy --confirm zarf-package-*.tar.zst
```
