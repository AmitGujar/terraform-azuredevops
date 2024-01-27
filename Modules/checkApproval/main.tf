terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.11.0"
    }
  }
}

resource "azuredevops_check_approval" "environment_one" {
  project_id           = var.project_id
  target_resource_id   = var.environment_one
  target_resource_type = "environment"

  requester_can_approve = true
  approvers = [
    var.auto_reviewers
  ]
}

resource "azuredevops_check_approval" "environment_two" {
  project_id           = var.project_id
  target_resource_id   = var.environment_two
  target_resource_type = "environment"

  requester_can_approve = true
  approvers = [
    var.auto_reviewers
  ]
}
