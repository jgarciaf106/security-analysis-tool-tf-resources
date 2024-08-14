terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "azurerm" {
  features {}

  
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

provider "databricks" {
  alias                       = "workspace"
  host                        = module.adb-lakehouse.workspace_url
  azure_workspace_resource_id = module.adb-lakehouse.workspace_id
  
}

provider "databricks" {
  alias               = "mws"
  host                = "https://accounts.azuredatabricks.net"
  account_id          = var.account_id
  client_id     = var.dbx_client_id
  client_secret = var.dbx_client_secret
}
