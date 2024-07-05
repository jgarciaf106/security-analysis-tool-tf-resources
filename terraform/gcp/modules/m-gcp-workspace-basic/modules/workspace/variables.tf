variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}

variable "google_project" {
  type        = string
  description = "Google project for VCP/workspace deployment"
}

variable "google_region" {
  type        = string
  description = "Google region for VCP/workspace deployment"
}

variable "prefix" {
  type        = string
  description = "Prefix to use in generated VPC name"
}

