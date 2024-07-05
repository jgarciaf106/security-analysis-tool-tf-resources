variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}
variable "databricks_host" {
  type        = string
  description = "Databricks host"
}

variable "databricks_google_service_account" {
  description = "Email of the service account used for deployment"
  type        = string
  default     = ""
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
  default     = "sat-gcp-lab"
}

variable "metastore_owner" {
  type        = string
  description = "Prefix to use in generated VPC name"
  default     = "sat_deploy_testing_group"
}
