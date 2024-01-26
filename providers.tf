terraform {
  required_version = ">= 1.0"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.11.0"
    }
  }
}

provider "azuredevops" {
  personal_access_token = var.azuredevops_pat_token
  org_service_url       = var.orgazation_service_url
}
