output "development_environment" {
  value = azuredevops_environment.development.name
}

output "production_environment" {
  value = azuredevops_environment.production.name
}
