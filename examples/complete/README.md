# Terraform Complete Example

This folder contains the the "complete" example of how to run this module.

## Running this module manually

1. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
2. Run `terraform init`.
3. Run `terraform init`.
4. Run `terraform apply`.
5. When you're done, run `terraform destroy`.

## Running automated tests against this module

1. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
2. Install [Golang](https://golang.org/) and make sure this code is checked out into your `GOPATH`.
3. `cd test`
4. `go test terraform_complete_test.go -v`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
https://docs.snowflake.com/en/user-guide/security-access-control-configure.html#creating-a-role-hierarchy

## Requirements

| Name | Version |
|------|---------|
| snowflake | >= 0.17.1 |

## Providers

| Name | Version |
|------|---------|
| snowflake | >= 0.17.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| snowflake\_account | The Snowflake account. | `string` | `null` | no |
| snowflake\_password | The Snowflake password. | `string` | `null` | no |
| snowflake\_region | The Snowflake region. | `string` | `"us-west-2"` | no |
| snowflake\_role | The Snowflake role. | `string` | `null` | no |
| snowflake\_username | The Snowflake username. | `string` | `null` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
