data "azuredevops_project" "aks_sec_project" {
  name = var.project_name
}

# reference to existing repository
data "azuredevops_git_repository" "aks_sec_default_repo" {
  project_id = data.azuredevops_project.aks_sec_project.id
  name       = var.default_repository_name
}

# reference to existing environment created by terraform
data "azuredevops_environment" "environment_one" {
  project_id = data.azuredevops_project.aks_sec_project.id
  name       = module.environment.development_environment
}

data "azuredevops_environment" "environment_two" {
  project_id = data.azuredevops_project.aks_sec_project.id
  name       = module.environment.production_environment
}
