#!/bin/bash

terraform_execute() {
    terraform init --upgrade
    terraform plan -out main.tfplan -var-file=secret.tfvars
    terraform apply main.tfplan
}

#     terraform state rm module.service_endpoint.azuredevops_serviceendpoint_azurerm.aks_sec_sp

if [ $1 == "d" ]; then
    terraform destroy -var-file=secret.tfvars --auto-approve

else
   terraform_execute
fi