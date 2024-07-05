variable "prefix" {
  type        = string
  description = "Prefix for resources"
  default     = "sat-aws-lab"
}
variable "databricks_host" {
  type        = string
  description = "Databricks Host"
}
variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}
variable "metastore_owner" {
  type    = string
  default = "sat_deploy_testing_group"
}
variable "dbx_client_id" {
  type        = string
  description = "Databricks Client ID"
}
variable "dbx_client_secret" {
  type        = string
  description = "Databricks Client Secret"
}

// aws variables
variable "aws_account_id" {
  type        = string
  description = "AWS Account ID"
}

variable "cidr_block" {
  description = "IP range for AWS VPC"
  type        = string
  default     = "16.0.0.0/20"
}

variable "region" {
  type        = string
  description = "AWS region to deploy to"
  default     = "us-east-1"
}
