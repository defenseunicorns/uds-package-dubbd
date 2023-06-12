# The version of Zarf to use. To keep this repo as portable as possible the Zarf binary will be downloaded and added to
# the build folder.
ZARF_VERSION := v0.27.1

DUBBD_OCI_VERSION := 0.0.2

# Figure out which Zarf binary we should use based on the operating system we are on
ZARF_BIN := zarf

.DEFAULT_GOAL := help

# Idiomatic way to force a target to always run, by having it depend on this dummy target
FORCE:

.PHONY: help
help: ## Show a list of all targets
	@grep -E '^\S*:.*##.*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/\1:\3/p' \
	| column -t -s ":"

.PHONY: clean
clean: ## Clean up build files
	@rm -rf ./build zarf-sbom

mkdir:
	@mkdir -p build

.PHONY: build
build: mkdir ## Build the Big Bang Zarf Package
	@echo "Creating the deploy package"
	@cd defense-unicorns-distro
	@$(ZARF_BIN) package create --confirm

default-build: ## All in one make target for the default di2me repo (only x86) - uses the current branch/tag of the repo
	make build
	make build/zarf
	make build/zarf-init.sha256

build:
	mkdir -p build

build/zarf: | build ## Download the Linux flavor of Zarf to the build dir
	echo "Downloading zarf"
	curl -sL https://github.com/defenseunicorns/zarf/releases/download/$(ZARF_VERSION)/zarf_$(ZARF_VERSION)_Linux_amd64 -o build/zarf
	chmod +x build/zarf

build/zarf-init.sha256: | build ## Download the init package and create a small file with the sha256sum of the package so the Makefile can check whether it needs to be updated
	echo "Downloading zarf-init-amd64-$(ZARF_VERSION).tar.zst"
	curl -sL https://github.com/defenseunicorns/zarf/releases/download/$(ZARF_VERSION)/zarf-init-amd64-$(ZARF_VERSION).tar.zst -o build/zarf-init-amd64-$(ZARF_VERSION).tar.zst
	echo "Creating shasum of the init package"
	shasum -a 256 build/zarf-init-amd64-$(ZARF_VERSION).tar.zst | awk '{print $$1}' > build/zarf-init.sha256

init-k3d-cluster:
	k3d cluster create mycluster --api-port 6443
	k3d kubeconfig merge mycluster -o /home/ubuntu/cluster-kubeconfig.yaml
	utils/metallb/install.sh
	echo "Running default build"
	make default-build
	echo "Running zarf init"
	cd build && ./zarf init --components git-server --confirm
	echo "Cluster is ready!"

destroy-k3d-cluster:
	k3d cluster delete mycluster

# You need to login to the registry before this will work
# build/zarf tools registry login ghcr.io
deploy-oci-dubbd-to-k3d:
	cd build && ./zarf package deploy --confirm oci://ghcr.io/defenseunicorns/packages/big-bang-distro-k3d:$(DUBBD_OCI_VERSION)-amd64 --oci-concurrency=15
