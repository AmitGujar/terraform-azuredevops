terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.11.0"
    }
  }
}

resource "azuredevops_serviceendpoint_azurerm" "aks_sec_sp" {
  project_id                             = var.project_id
  service_endpoint_name                  = var.service_endpoint_name
  description                            = "Managed by Terraform"
  service_endpoint_authentication_scheme = "ServicePrincipal"
  credentials {
    serviceprincipalid  = var.client_id
    serviceprincipalkey = var.client_secret
  }
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = var.subscription_name
}

resource "azuredevops_serviceendpoint_dockerregistry" "acr_sp" {
  project_id            = var.project_id
  service_endpoint_name = "ACR_Connection"
  docker_registry       = var.registry_url
  docker_username       = var.docker_id
  docker_password       = var.docker_password
  registry_type         = var.registry_type
}
