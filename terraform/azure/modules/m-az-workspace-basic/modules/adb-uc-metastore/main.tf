# metastore resources
# Create a new Resource Group
resource "azurerm_resource_group" "this" {
  count    = var.use_existing_resource_group == null ? 1 : 0
  name     = "${var.prefix}.rg"
  location = var.location
}

# get one already created https://developer.hashicorp.com/terraform/language/data-sources
data "azurerm_resource_group" "this" {
  count = var.use_existing_resource_group != null ? 1 : 0
  name  = var.use_existing_resource_group
}

#get the service principal data
data "databricks_service_principal" "metastore_admin" {
  application_id = "5f8b92e4-2340-4e10-9ddb-3a861bbce721"  # Replace with your service principal's application ID
}

locals {
  rg_name     = var.use_existing_resource_group == null ? azurerm_resource_group.this[0].name : data.azurerm_resource_group.this[0].name
  rg_id       = var.use_existing_resource_group == null ? azurerm_resource_group.this[0].id : data.azurerm_resource_group.this[0].id
  rg_location = var.use_existing_resource_group == null ? azurerm_resource_group.this[0].location : data.azurerm_resource_group.this[0].location
}

resource "azurerm_databricks_access_connector" "access_connector" {
  name                = var.access_connector_name
  resource_group_name = local.rg_name
  location            = local.rg_location
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_account" "unity_catalog" {
  name                     = var.metastore_storage_name
  location                 = local.rg_location
  resource_group_name      = local.rg_name
  tags                     = var.tags
  account_tier             = "Standard"
  account_replication_type = "GRS"
  is_hns_enabled           = true
}

resource "azurerm_storage_container" "unity_catalog" {
  name                  = "${var.metastore_storage_name}-container"
  storage_account_name  = azurerm_storage_account.unity_catalog.name
  container_access_type = "private"
}

locals {
  # Steps 2-4 in https://learn.microsoft.com/en-us/azure/databricks/data-governance/unity-catalog/azure-managed-identities#--step-2-grant-the-managed-identity-access-to-the-storage-account
  uc_roles = [
    "Storage Blob Data Contributor",  # Normal data access
    "Storage Queue Data Contributor", # File arrival triggers
    "EventGrid EventSubscription Contributor",
  ]
}

resource "azurerm_role_assignment" "unity_catalog" {
  for_each             = toset(local.uc_roles)
  scope                = azurerm_storage_account.unity_catalog.id
  role_definition_name = each.value
  principal_id         = azurerm_databricks_access_connector.access_connector.identity[0].principal_id
}

# metastore creation
resource "databricks_metastore" "databricks-metastore" {
  name          = var.metastore_name
  region        = var.location
  storage_root = format("abfss://%s@%s.dfs.core.windows.net/",
    azurerm_storage_container.unity_catalog.name,
  azurerm_storage_account.unity_catalog.name)
  owner = data.databricks_service_principal.metastore_admin.external_id
  force_destroy = true
}

# give access to the access connector that will be assumed by Unity Catalog to access data
resource "databricks_metastore_data_access" "access-connector-data-access" {
  metastore_id = databricks_metastore.databricks-metastore.id
  name         = var.access_connector_name
  azure_managed_identity {
    access_connector_id = azurerm_databricks_access_connector.access_connector.id
  }
  is_default    = true
  force_destroy = true
}

#this will assign the metastore to to the workspace
resource "databricks_metastore_assignment" "this" {
  metastore_id = databricks_metastore.databricks-metastore.id
  workspace_id = var.workspace_id
  default_catalog_name = "main"
}
