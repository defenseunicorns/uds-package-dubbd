#!/bin/bash
k3d cluster delete -c k3d.yaml
k3d cluster create -c k3d.yaml

zarf package create --architecture amd64 --confirm
zarf init --components=git-server --confirm 
zarf package deploy --confirm zarf-package-pepr-demo-amd64-2.1.0.tar.zst