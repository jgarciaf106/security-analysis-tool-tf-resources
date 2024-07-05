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

  

  skip_provider_registration = true
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
}


