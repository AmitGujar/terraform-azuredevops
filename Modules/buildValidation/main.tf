terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.11.0"
    }
  }
}

# creating repository on Azure DevOps project
# resource "azuredevops_git_repository" "new_repo" {
#   project_id = var.project_id
#   name       = "terraform_managed"
#   initialization {
#     init_type = "Clean"
#   }
# }

# creating build definition on Azure DevOps project
resource "azuredevops_build_definition" "build_definition" {
  project_id = var.project_id
  name       = "Branch Validation"

  repository {
    repo_type = "TfsGit"
    # repo_id   = azuredevops_git_repository.new_repo.id
    repo_id     = var.repository_id
    branch_name = var.repository_ref_branch
    yml_path    = "build_templates/main.yml"
  }
}

resource "azuredevops_branch_policy_build_validation" "build_validation" {
  project_id = var.project_id

  enabled  = true
  blocking = true

  settings {
    display_name        = "Branch build validation policy"
    build_definition_id = azuredevops_build_definition.build_definition.id
    valid_duration      = 720
    filename_patterns = [
      "*.*"
    ]

    # this scope defines the branches that will be validated
    scope {
      # repository_id  = azuredevops_git_repository.new_repo.id
      repository_id = var.repository_id
      # repository_ref = azuredevops_git_repository.new_repo.default_branch
      repository_ref = var.repository_ref_branch
      match_type     = "Exact"
    }

    # this scope defines the branches that will be validated whose name starts with dev
    scope {
      # repository_id  = azuredevops_git_repository.new_repo.id
      repository_id  = null
      repository_ref = "refs/heads/dev"
      match_type     = "Prefix"
    }

    # this scope defines the main branch in all repos will be validated
    # this scope is also act as a inheritance scope
    scope {
      # match_type = "DefaultBranch"

      #! by this way the inheritance scope will be applied to certain branch
      repository_ref = var.repository_ref_branch
      match_type     = "Exact"
    }
  }
}

# it will apply minmium number of reviewers required to approve a pull request



#! to be done laters



# resource "azuredevops_branch_policy_min_reviewers" "min_reviewers" {
#   project_id = var.project_id

#   enabled  = true
#   blocking = true

#   settings {
#     reviewer_count                         = 1 #minimum reviewers required to approve
#     submitter_can_vote                     = false
#     last_pusher_cannot_approve             = true
#     allow_completion_with_rejects_or_waits = false

#     scope {
#       repository_id  = var.repository_id
#       repository_ref = var.repository_ref_branch
#       match_type     = "Exact"
#     }

#     # inheritance scope
#     scope {
#       # match_type = "DefaultBranch"

#       #! by this way the inheritance scope will be applied to certain branch
#       repository_ref = var.repository_ref_branch
#       match_type     = "Exact"
#     }
#   }
# }
