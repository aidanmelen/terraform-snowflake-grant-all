terraform {
  required_version = ">= 0.12.0"

  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = ">= 0.17.1"
    }
  }
}
