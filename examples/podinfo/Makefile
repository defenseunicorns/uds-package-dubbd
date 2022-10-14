# The version of Big Bang to use.
BIGBANG_VERSION := 1.43.0

# The version of Zarf to use. To keep this repo as portable as possible the Zarf binary will be downloaded and added to
# the build folder.
ZARF_VERSION := v0.22.1

ZARF_BIN := zarf

# The version of the build harness container to use
BUILD_HARNESS_VERSION := 0.0.13

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
	@rm -rf ./build

.PHONY: all

build:
	@mkdir -p build

all: | build ## Build the podinfo zarf package
	@echo "Creating the podinfo zarf package"
	@$(ZARF_BIN) package create --skip-sbom --confirm
	@mv zarf-package-podinfo-amd64.tar.zst build/zarf-package-podinfo-amd64.tar.zst
