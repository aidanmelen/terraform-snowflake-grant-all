/*
 * https://docs.snowflake.com/en/user-guide/security-access-control-privileges.html#database-privileges
 */

locals {
  database_imported_from_share = lookup(var.database, "database_imported_from_share", false)
  database_name                = lookup(var.database, "database_name", null)
  database_roles               = lookup(var.database, "roles", null)
  database_shares              = lookup(var.database, "shares", null)
  database_with_grant_option   = lookup(var.database, "with_grant_option", null)
}

resource "snowflake_database_grant" "create_schema" {
  count = local.database_name != null ? 1 : 0

  database_name     = local.database_name
  privilege         = "CREATE SCHEMA"
  roles             = local.database_roles
  shares            = local.database_shares
  with_grant_option = local.database_with_grant_option
}

resource "snowflake_database_grant" "import_privileges" {
  count = local.database_name != null && local.database_imported_from_share != false ? 1 : 0

  database_name     = local.database_name
  privilege         = "IMPORTED PRIVILEGES"
  roles             = local.database_roles
  shares            = local.database_shares
  with_grant_option = local.database_with_grant_option
}

resource "snowflake_database_grant" "modify" {
  count = local.database_name != null ? 1 : 0

  database_name     = local.database_name
  privilege         = "MODIFY"
  roles             = local.database_roles
  shares            = local.database_shares
  with_grant_option = local.database_with_grant_option
}

resource "snowflake_database_grant" "monitor" {
  count = local.database_name != null ? 1 : 0

  database_name     = local.database_name
  privilege         = "MONITOR"
  roles             = local.database_roles
  shares            = local.database_shares
  with_grant_option = local.database_with_grant_option
}

resource "snowflake_database_grant" "reference_usage" {
  count = local.database_name != null ? 1 : 0

  database_name     = local.database_name
  privilege         = "REFERENCE_USAGE"
  roles             = local.database_roles
  shares            = local.database_shares
  with_grant_option = local.database_with_grant_option
}

resource "snowflake_database_grant" "usage" {
  count = local.database_name != null ? 1 : 0

  database_name     = local.database_name
  privilege         = "USAGE"
  roles             = local.database_roles
  shares            = local.database_shares
  with_grant_option = local.database_with_grant_option
}
