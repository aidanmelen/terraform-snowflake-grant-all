/*
 * https://docs.snowflake.com/en/user-guide/security-access-control-privileges.html#schema-privileges
 */

locals {
  schema_database_name     = lookup(var.schema, "database_name", null)
  schema_on_future         = lookup(var.schema, "on_future", null)
  schema_roles             = lookup(var.schema, "roles", null)
  schema_name              = lookup(var.schema, "schema_name", null)
  schema_shares            = lookup(var.schema, "shares", null)
  schema_with_grant_option = lookup(var.schema, "with_grant_option", null)
  schema_count             = local.schema_name != null || local.schema_on_future != null ? 1 : 0
}

resource "snowflake_schema_grant" "modify" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "MODIFY"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "monitor" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "MONITOR"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "usage" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "USAGE"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_table" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE TABLE"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_external_table" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE EXTERNAL TABLE"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_view" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE VIEW"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_materialized_view" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE MATERIALIZED VIEW"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_masking_policy" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE MASKING POLICY"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_stage" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE STAGE"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_file_format" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE FILE FORMAT"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_sequence" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE SEQUENCE"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_function" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE FUNCTION"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_pipe" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE PIPE"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_stream" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE STREAM"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_task" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE TASK"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}

resource "snowflake_schema_grant" "create_procedure" {
  count = local.schema_count

  database_name     = local.schema_database_name
  on_future         = local.schema_on_future
  privilege         = "CREATE PROCEDURE"
  roles             = local.schema_roles
  schema_name       = local.schema_name
  shares            = local.schema_shares
  with_grant_option = local.schema_with_grant_option
}
