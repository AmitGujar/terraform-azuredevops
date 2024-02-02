# output "service_endpoint_output" {
#   value = module.service_endpoint.service_endpoint_output
# }

output "amit_gujar_id" {
  value = var.auto_reviewers
}

output "repository_ref_branch" {
  value = var.repository_ref_branch
}

output "repository_name" {
  value = data.azuredevops_git_repository.aks_sec_default_repo.name
}

output "environment_one" {
  value = module.environment.development_environment_name
}

output "environment_two" {
  value = module.environment.production_environment_name
}
