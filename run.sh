#!/bin/bash

terraform_execute() {
    terraform init --upgrade
    terraform plan -out main.tfplan -var-file=secret.tfvars
    terraform apply main.tfplan
}
terraform_execute

# if [ $1 == "first" ]; then
#     terraform_execute

# else
#     terraform state rm module.service_endpoint.azuredevops_serviceendpoint_azurerm.aks_sec_sp
# fi
