[![Lint Status](https://github.com/aidan-melen/terraform-snowflake-grant-all/workflows/Lint/badge.svg)](https://github.com/aidan-melen/terraform-snowflake-grant-all/actions)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
<!-- [![cookiecutter-tf-module](https://img.shields.io/badge/cookiecutter--tf--module-enabled-brightgreen)](https://github.com/aidan-melen/cookiecutter-tf-module) -->
[![tflint](https://img.shields.io/badge/code--style-tflint-black)](https://github.com/terraform-linters/tflint)

# terraform-snowflake-grant-all

A terraform module to help issue GRANT ALL for databases, warehouses, and
schemas in Snowflake.

There are some resources in the Snowflake provider that support the `GRANT ALL`
alias, but they do not create granular resources in terraform state.

## Usage


### complete example

A complete example can be found at [examples/complete](examples/complete).

<details><summary>Click to show</summary>

```hcl
/*
 * https://docs.snowflake.com/en/user-guide/security-access-control-configure.html#creating-a-role-hierarchy
 */
terraform {
  required_version = ">= 0.13.0"
}

provider snowflake {
  username = var.snowflake_username
  password = var.snowflake_password
  account  = var.snowflake_account
  role     = var.snowflake_role
  region   = var.snowflake_region
}

/*
 * ACCOUNT OBJECTS
 */
resource "snowflake_database" "database" {
  name = "DATABASE_A"
}

resource "snowflake_schema" "schema" {
  name     = "SCHEMA_1"
  database = snowflake_database.database.name
}

resource "snowflake_warehouse" "warehouse" {
  name                = "WAREHOUSE_1"
  auto_resume         = true
  auto_suspend        = 60
  initially_suspended = true
  warehouse_size      = "X-Small"
}

/*
 * ROLES
 */
resource "snowflake_role" "custom" {
  name = "CUSTOM"
  depends_on = [
    snowflake_database.database,
    snowflake_schema.schema,
    snowflake_warehouse.warehouse,
  ]
}

resource "snowflake_role" "admin" {
  name = "ADMIN"
  depends_on = [
    snowflake_database.database,
    snowflake_schema.schema,
    snowflake_warehouse.warehouse,
  ]
}

/*
 * CUSTOM ROLE GRANTS
 */
resource "snowflake_warehouse_grant" "warehouse" {
  warehouse_name = snowflake_warehouse.warehouse.name
  privilege      = "USAGE"
  roles          = snowflake_role.custom.name
}

resource "snowflake_database_grant" "database" {
  database_name = snowflake_database.database.name
  privilege     = "USAGE"
  roles         = snowflake_role.custom.name
}

module "grant_all_on_schema_to_user_role" {
  source = "../../"
  schema = {
    database_name = snowflake_database.database.name
    on_future     = true
    roles         = [snowflake_role.custom.name]
    schema_name   = snowflake_schema.schema.name
  }
}

/*
 * ADMIN ROLE GRANTS
 */
module "grant_all_on_warehouse_database_schema_to_admin_role" {
  source = "../../"
  warehouse = {
    warehouse_roles             = [snowflake_role.admin.name]
    warehouse_warehouse_name    = snowflake_warehouse.warehouse.name
    warehouse_with_grant_option = false
  }
  database = {
    database_name = snowflake_database.database.name
    roles         = [snowflake_role.admin.name]
  }
  schema = {
    database_name = snowflake_database.database.name
    on_future     = true
    roles         = [snowflake_role.admin.name]
    schema_name   = snowflake_schema.schema.name
  }
}

```

</details>

## Makefile Targets

```text
Available targets:

  all                                 Run install and lint
  install                             Initialize and install pre-commit
  lint                                Lint terraform code
  test                                Run complete example tests
```

## License

MIT Licensed. See [LICENSE](./LICENSE) for full details.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| snowflake | >= 0.17.1 |

## Providers

| Name | Version |
|------|---------|
| snowflake | >= 0.17.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| database | Grants all privileges, except OWNERSHIP, on a database.<br>Set database\_imported\_from\_share to true to grant 'IMPORTED PRIVILEGES'. | `any` | <pre>{<br>  "database_imported_from_share": false,<br>  "database_name": null,<br>  "roles": null,<br>  "shares": null,<br>  "with_grant_option": null<br>}</pre> | no |
| schema | Grants all privileges, except OWNERSHIP, on a schema. | `any` | <pre>{<br>  "database_name": null,<br>  "on_future": false,<br>  "roles": null,<br>  "schema_name": null,<br>  "shares": null,<br>  "with_grant_option": false<br>}</pre> | no |
| warehouse | Grants all privileges, except OWNERSHIP, on a warehouse. | `any` | <pre>{<br>  "roles": null,<br>  "warehouse_name": null,<br>  "with_grant_option": false<br>}</pre> | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
