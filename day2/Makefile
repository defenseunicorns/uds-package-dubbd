# The version of Big Bang to use.
BIGBANG_VERSION := 1.52.0

ZARF_BIN := zarf

.DEFAULT_GOAL := help

# Idiomatic way to force a target to always run, by having it depend on this dummy target
FORCE:

.PHONY: help
help: ## Show a list of all targets
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/\1:\3/p' \
	| column -t -s ":"

.PHONY: update
update: ## Build the day2 package and immediately deploy it
	$(ZARF_BIN) package create --skip-sbom --set BIGBANG_VERSION=$(BIGBANG_VERSION) --confirm
	$(ZARF_BIN) package deploy zarf-package-day-two-update-amd64.tar.zst --confirm

.PHONY: k9s
k9s: ## Pull up K9s
	$(ZARF_BIN) tools k9s
