# versions.tf
terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }

    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "databricks" {
  alias         = "mws"
  host          = var.databricks_account_host
  account_id    = var.databricks_account_id
  client_id     = var.dbx_client_id
  client_secret = var.dbx_client_secret
}

