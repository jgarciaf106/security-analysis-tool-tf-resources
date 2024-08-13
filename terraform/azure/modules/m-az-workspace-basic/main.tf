module "my_adb_lakehouse" {
  source                = "./modules/adb-lakehouse"
  prefix                          = var.prefix
  environment_name                = var.environment_name
  location                        = var.location
  spoke_vnet_address_space        = var.spoke_vnet_address_space
  use_existing_resource_group     = var.use_existing_resource_group
  managed_resource_group_name     = var.managed_resource_group_name
  databricks_workspace_name       = "${var.prefix}-workspace"
  dbfsname = var.dbfsname
  private_subnet_address_prefixes = [cidrsubnet(var.spoke_vnet_address_space, 3, 0)]
  public_subnet_address_prefixes  = [cidrsubnet(var.spoke_vnet_address_space, 3, 1)]
  tags = var.tags
}

module "my_unity_catalog" {
  source                = "./modules/adb-uc-metastore"
  prefix                      = var.prefix
  metastore_storage_name      = replace("${var.prefix}-mss", "-", "")
  metastore_name              = "${var.prefix}-metastore"
  access_connector_name       = "${var.prefix}-access-connector"
  workspace_id                = module.my_adb_lakehouse.workspace_id
  use_existing_resource_group = var.use_existing_resource_group
  location                    = var.location
  tags = var.tags
}