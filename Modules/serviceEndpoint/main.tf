terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
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
