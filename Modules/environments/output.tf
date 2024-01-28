output "development_environment_name" {
  value = azuredevops_environment.development.name
}

output "production_environment_name" {
  value = azuredevops_environment.production.name
}

output "development_environment_id" {
  value = azuredevops_environment.development.id
}

output "production_environment_id" {
  value = azuredevops_environment.production.id
}
