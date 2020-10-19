/*
 * https://docs.snowflake.com/en/user-guide/security-access-control-configure.html#creating-a-role-hierarchy
 */
terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = ">= 0.17.1"
    }
  }
}

# provider "snowflake" {
#   # Configuration options
# }
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
  roles          = [snowflake_role.custom.name]
}

resource "snowflake_database_grant" "database" {
  database_name = snowflake_database.database.name
  privilege     = "USAGE"
  roles         = [snowflake_role.custom.name]
}

module "grant_all_on_schema_to_user_role" {
  source = "../../"
  schema = {
    database_name = snowflake_database.database.name
    # on_future     = true
    roles       = [snowflake_role.custom.name]
    schema_name = snowflake_schema.schema.name
  }
}

/*
 * ADMIN ROLE GRANTS
 */
module "grant_all_on_db_schema_wh_to_admin_role" {
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
    # on_future     = true
    roles       = [snowflake_role.admin.name]
    schema_name = snowflake_schema.schema.name
  }
}
