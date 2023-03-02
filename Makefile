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
