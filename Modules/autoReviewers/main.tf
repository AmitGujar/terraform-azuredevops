terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.11.0"
    }
  }
}

# resource "azuredevops_git_repository" "tf_git_repo" {
#   project_id = var.project_id
#   name       = "tf_repository_test"
#   initialization {
#     init_type = "Clean"
#   }
# }

# resource "azuredevops_user_entitlement" "tf_user" {
#   principal_name       = "amit.gujar@celebaltech.com"
#   account_license_type = "basic"
# }

resource "azuredevops_branch_policy_auto_reviewers" "tf_auto_reviewers" {
  project_id = var.project_id

  enabled  = true
  blocking = true

  settings {
    auto_reviewer_ids  = [var.auto_reviewers]
    submitter_can_vote = false
    message            = "tf generated reviewer"
    path_filters       = ["*.*"]

    scope {
      # repository_id  = azuredevops_git_repository.tf_git_repo.id
      # repository_ref = azuredevops_git_repository.tf_git_repo.default_branch
      repository_id  = var.repository_id
      repository_ref = var.repository_ref_branch
      match_type     = "Exact"
    }

    scope {
      match_type = "DefaultBranch"
    }
  }
}
