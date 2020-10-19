/*
 * https://docs.snowflake.com/en/user-guide/security-access-control-privileges.html#virtual-warehouse-privileges
 */

locals {
  warehouse_roles             = lookup(var.warehouse, "roles", null)
  warehouse_name              = lookup(var.warehouse, "warehouse_name", null)
  warehouse_with_grant_option = lookup(var.warehouse, "with_grant_option", null)
}

resource "snowflake_warehouse_grant" "modify" {
  count = local.warehouse_name != null ? 1 : 0

  privilege         = "MODIFY"
  roles             = local.warehouse_roles
  warehouse_name    = local.warehouse_name
  with_grant_option = local.warehouse_with_grant_option
}

resource "snowflake_warehouse_grant" "monitor" {
  count = local.warehouse_name != null ? 1 : 0

  privilege         = "MONITOR"
  roles             = local.warehouse_roles
  warehouse_name    = local.warehouse_name
  with_grant_option = local.warehouse_with_grant_option
}

resource "snowflake_warehouse_grant" "operate" {
  count = local.warehouse_name != null ? 1 : 0

  privilege         = "OPERATE"
  roles             = local.warehouse_roles
  warehouse_name    = local.warehouse_name
  with_grant_option = local.warehouse_with_grant_option
}

resource "snowflake_warehouse_grant" "usage" {
  count = local.warehouse_name != null ? 1 : 0

  privilege         = "USAGE"
  roles             = local.warehouse_roles
  warehouse_name    = local.warehouse_name
  with_grant_option = local.warehouse_with_grant_option
}
