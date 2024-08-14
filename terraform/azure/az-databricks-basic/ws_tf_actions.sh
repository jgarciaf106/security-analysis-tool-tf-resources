#!/bin/bash

PLAN_FILE="tfplan"
COMMON_ARGS=(
    -no-color
    -input=false
)
INIT_VARS=(
    -backend-config="resource_group_name=$BACKEND_RG_NAME" 
    -backend-config="storage_account_name=$BACKEND_SA_NAME" 
    -backend-config="container_name=$BACKEND_CONTAINER_NAME"
    -backend-config="key=$BACKEND_KEY"  
    -backend-config="client_id=$AZURE_CLIENT_ID"
    -backend-config="client_secret=$AZURE_CLIENT_SECRET"
    -backend-config="tenant_id=$AZURE_TENANT_ID" 
    -backend-config="subscription_id=$AZURE_SUBSCRIPTION_ID" 

)
VAR_ARGS=(
    -var="subscription_id=$AZURE_SUBSCRIPTION_ID"
    -var="tenant_id=$AZURE_TENANT_ID"
    -var="client_secret=$AZURE_CLIENT_SECRET"
    -var="client_id=$AZURE_CLIENT_ID"
    -var="dbx_client_id=$DATABRICKS_SP_CLIENT_ID"
    -var="dbx_client_secret=$DATABRICKS_SP_CLIENT_SECRET"
    -var="account_id=$DATABRICKS_ACCOUNT_ID"
    -var="prefix=$PREFIX"
    -var="location=$LOCATION"
    -var="create_resource_group=$CREATE_RESOURCE_GROUP"
    -var="spoke_resource_group_name=$SPOKE_RESOURCE_GROUP_NAME"
    -var="managed_resource_group_name=$MANAGED_RESOURCE_GROUP_NAME"
    -var="environment_name=$ENVIRONMENT"
    -var="spoke_vnet_address_space=$SPOKE_VNET_ADDRESS_SPACE"
    -var="shared_resource_group_name=$SHARED_RESOURCE_GROUP_NAME"
    -var="admin_user=$ADMIN"
    -var="dbfsname=$DBFS_NAME"

)

case "$1" in
fmt)
    terraform fmt -check
    ;;
init)
    terraform init ${COMMON_ARGS[0]} ${INIT_VARS[@]}
    ;;
validate)
    terraform validate ${COMMON_ARGS[0]}
    ;;
plan)
    terraform plan ${COMMON_ARGS[@]} ${VAR_ARGS[@]} -lock=false -out="$PLAN_FILE"
    ;;
apply)
    terraform apply ${COMMON_ARGS[@]} "$PLAN_FILE"
    ;;
destroy)
    terraform destroy ${COMMON_ARGS[@]} ${VAR_ARGS[@]}  -auto-approve -lock=false
    ;;
*)
    echo "Invalid argument. Use 'fmt', 'init', 'validate', 'plan', 'apply', 'destroy'."
    exit 1
    ;;
esac



