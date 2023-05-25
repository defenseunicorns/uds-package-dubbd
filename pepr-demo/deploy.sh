#!/bin/bash
k3d cluster delete -c k3d.yaml
k3d cluster create -c k3d.yaml

/home/rob/du/zarf/build/zarf package create --architecture amd64 --confirm
/home/rob/du/zarf/build/zarf init --components=git-server --confirm
/home/rob/du/zarf/build/zarf package deploy --tmpdir=/home/rob/rob-zarf --confirm /home/rob/du/zarf-package-big-bang/pepr-demo/zarf-package-pepr-demo-amd64-2.1.0.tar.zst