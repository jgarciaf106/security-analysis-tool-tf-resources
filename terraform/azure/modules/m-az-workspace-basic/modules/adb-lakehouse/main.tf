resource "azurerm_resource_group" "this" {
  count    = var.use_existing_resource_group == null ? 1 : 0
  name     = "${var.prefix}.rg"
  location = var.location
  tags     = var.tags
}

data "azurerm_resource_group" "this" {
  count = var.use_existing_resource_group != null ? 1 : 0
  name  = var.use_existing_resource_group
}

locals {
  rg_name     = var.use_existing_resource_group == null ? azurerm_resource_group.this[0].name : data.azurerm_resource_group.this[0].name
  rg_id       = var.use_existing_resource_group == null ? azurerm_resource_group.this[0].id : data.azurerm_resource_group.this[0].id
  rg_location = var.use_existing_resource_group == null ? azurerm_resource_group.this[0].location : data.azurerm_resource_group.this[0].location
}

data "azurerm_client_config" "current" {
}

