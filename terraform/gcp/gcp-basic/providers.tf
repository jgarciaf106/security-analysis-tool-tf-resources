terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.google_project
  region  = var.google_region
}

provider "databricks" {
  alias                  = "mws"
  host                   = var.databricks_host
  google_service_account = var.databricks_google_service_account
  account_id             = var.databricks_account_id
}