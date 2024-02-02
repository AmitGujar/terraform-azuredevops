# module "service_endpoint" {
#   source                = "./Modules/serviceEndpoint"
#   project_id            = data.azuredevops_project.aks_sec_project.id
#   service_endpoint_name = var.service_endpoint_name
#   client_id             = var.client_id
#   client_secret         = var.client_secret
#   tenant_id             = var.tenant_id
#   subscription_id       = var.subscription_id
#   subscription_name     = var.subscription_name
# }

module "auto_reviewer" {
  source         = "./Modules/autoReviewers"
  project_id     = data.azuredevops_project.aks_sec_project.id
  auto_reviewers = var.auto_reviewers
  repository_id  = data.azuredevops_git_repository.aks_sec_default_repo.id
  # repository_ref_branch = data.azuredevops_git_repository.aks_sec_default_repo.default_branch
  repository_ref_branch = var.repository_ref_branch
}

module "buildValidation" {
  source        = "./Modules/buildValidation"
  project_id    = data.azuredevops_project.aks_sec_project.id
  repository_id = data.azuredevops_git_repository.aks_sec_default_repo.id
  # repository_ref_branch = data.azuredevops_git_repository.aks_sec_default_repo.default_branch
  repository_ref_branch = var.repository_ref_branch
}

module "environment" {
  source          = "./Modules/environments"
  project_id      = data.azuredevops_project.aks_sec_project.id
  environment_one = var.environment_one
  environment_two = var.environment_two
}

module "checkApproval" {
  source          = "./Modules/checkApproval"
  project_id      = data.azuredevops_project.aks_sec_project.id
  auto_reviewers  = var.auto_reviewers
  environment_one = module.environment.development_environment_id
  environment_two = module.environment.production_environment_id
}
