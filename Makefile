ARTIFACT_DIR = artifacts

SHELL := /bin/bash
export PATH := $(shell yarn bin):$(PATH)

ifdef CI
    ESLINT_ARGS=--format junit --output-file $(ARTIFACT_DIR)/test_results/eslint/eslint.junit.xml
	JEST_ENV_VARIABLES=JEST_SUITE_NAME="Jest Tests" JEST_JUNIT_OUTPUT=$(ARTIFACT_DIR)/test_results/jest/jest.junit.xml
    JEST_EXTRA_ARGS=--testResultsProcessor ./node_modules/jest-junit
else
    ESLINT_ARGS=
    JEST_ENV_VARIABLES=
    JEST_EXTRA_ARGS=
endif

.PHONY: help
help:
	@echo "--------------------- Useful Commands for Development ----------------------"
	@echo "make help                            - show this help message"
	@echo "make install                         - install dependencies, blows up node_modules"
	@echo "make lint                            - runs eslint"
	@echo "make lint-fix                        - attempts to autofix linting errors"
	@echo "make start                           - starts server locally"
	@echo "make package                         - packages the functions to deploy"

# ---- Installing, Building and Running ----

.PHONY: install
install: check-versions clean node_modules

.PHONY: package
package: check-versions node_modules
	NODE_ENV=production serverless package

.PHONY: start
start: check-versions node_modules
	-serverless dynamodb install
	serverless offline start

# -------------- Linting --------------

.PHONY: lint
lint: check-versions node_modules ${ARTIFACT_DIR}
	eslint ${ESLINT_ARGS} .

.PHONY: lint-fix
lint-fix: check-versions node_modules
	eslint --fix .

# --------------- CI Scripts -----------------

.PHONY: install-no-clean
install-no-clean: check-versions node_modules

.PHONY: install-deployment-deps
install-deployment-deps: check-versions
	./scripts/install-deployment-deps.sh

.PHONY: deploy
deploy: check-versions node_modules
	./scripts/deploy.sh

# ----------------- Helpers ------------------

.PHONY: check-versions
check-versions:
	@./scripts/check-versions.sh

.PHONY: clean
clean: clean-dynamodb
	@rm -rf ${ARTIFACT_DIR}
	@rm -rf node_modules

.PHONY: clean-dynamodb
clean-dynamodb:
	@-pkill -f dynamodb

.PHONY: test
test: check-versions node_modules ${ARTIFACT_DIR}
	@${JEST_ENV_VARIABLES} jest ${JEST_ARGS}

.PHONY: test-snapshots
test-snapshots: check-versions node_modules ${ARTIFACT_DIR}
	@${JEST_ENV_VARIABLES} jest -u ${JEST_ARGS}

${ARTIFACT_DIR}:
	@mkdir -p ${ARTIFACT_DIR}/test_results/eslint

node_modules:
	yarn install
	@touch node_modules