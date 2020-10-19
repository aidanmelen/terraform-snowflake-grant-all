variable "snowflake_username" {
  description = "The Snowflake username."
  type        = string
  default     = null
}

variable "snowflake_password" {
  description = "The Snowflake password."
  type        = string
  default     = null
}

variable "snowflake_account" {
  description = "The Snowflake account."
  type        = string
  default     = null
}

variable "snowflake_role" {
  description = "The Snowflake role."
  type        = string
  default     = null
}

variable "snowflake_region" {
  description = "The Snowflake region."
  type        = string
  default     = "us-west-2"
}
