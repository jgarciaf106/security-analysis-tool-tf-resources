module "aws_workspace_basic" {
  source = "../modules/m-aws-workspace-basic"

  # databricks variables
  databricks_account_id = var.databricks_account_id
  metastore_owner       = var.metastore_owner

  # aws variables
  aws_account_id = var.aws_account_id
  cidr_block     = var.cidr_block
  region         = var.region
  tags = {
    "RemoveAfter" : "2030-12-31"
  }

  prefix = var.prefix

  providers = {
    databricks = databricks.mws
  }
}
