SHELL := /bin/bash

.PHONY: all install lint
all: install lint

.PHONY: install
install:
	terraform init
	cd examples/complete && terraform init && cd ../..
	git init
	git add -A
	pre-commit install

.PHONY: lint
lint:
	SNOWFLAKE_ACCOUNT='placeholder' SNOWFLAKE_USER='placeholder' pre-commit run

.PHONY: test
test: test-complete
	go get github.com/gruntwork-io/terratest/modules/terraform
	go test test/terraform_complete_test.go
