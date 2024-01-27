terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.11.0"
    }
  }
}

resource "azuredevops_environment" "development" {
  project_id  = var.project_id
  name        = var.environment_one
  description = "Development environment Managed by Terraform"
}

resource "azuredevops_environment" "production" {
  project_id  = var.project_id
  name        = var.environment_two
  description = "Production environment Managed by Terraform"
}
