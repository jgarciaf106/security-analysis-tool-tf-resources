variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}

variable "aws_account_id" {
  type = string
}

variable "tags" {
  type        = map(string)
  description = "Optional tags to add to created resources"
}

variable "cidr_block" {
  description = ""
  type        = string
}

variable "region" {
  type        = string
  description = "AWS region to deploy to"
}

variable "prefix" {
  type        = string
  description = "Prefix for use in the generated names"
}

variable "metastore_owner" {
  type        = string
  description = "Owner of the metastore"
}
