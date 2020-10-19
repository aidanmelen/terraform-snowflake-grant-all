variable "warehouse" {
  description = "Grants all privileges, except OWNERSHIP, on a warehouse."
  type        = any
  default = {
    roles             = null
    warehouse_name    = null
    with_grant_option = false
  }
}

variable "database" {
  description = <<-EOT
    Grants all privileges, except OWNERSHIP, on a database.
    Set database_imported_from_share to true to grant 'IMPORTED PRIVILEGES'.
  EOT
  type        = any
  default = {
    database_imported_from_share = false
    database_name                = null
    roles                        = null
    shares                       = null
    with_grant_option            = null
  }
}

variable "schema" {
  description = "Grants all privileges, except OWNERSHIP, on a schema."
  type        = any
  default = {
    database_name     = null
    on_future         = false
    roles             = null
    schema_name       = null
    shares            = null
    with_grant_option = false
  }
}
