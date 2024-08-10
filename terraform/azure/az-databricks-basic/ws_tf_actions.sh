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
    -backend-config="client_id=$CLIENT_ID"
    -backend-config="tenant_id=$TENANT_ID" 
    -backend-config="subscription_id=$SUBSCRIPTION_ID" 
    -backend-config="key=$KEY" 
)
VAR_ARGS=(
    -var="subscription_id=$SUBSCRIPTION_ID"
    -var="tenant_id=$TENANT_ID"
    -var="client_secret=$CLIENT_SECRET"
    -var="client_id=$CLIENT_ID"

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

