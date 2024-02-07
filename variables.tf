variable "orgazation_service_url" {
  type        = string
  description = "This will be the url of the Azure DevOps organization"
}

variable "azuredevops_pat_token" {
  type        = string
  description = "This will be the personal access token for Azure DevOps"

}

variable "service_endpoint_name" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "subscription_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "default_repository_name" {
  type = string
}

variable "auto_reviewers" {
  type = string
}

variable "environment_one" {
  type    = string
  default = "Development"
}

variable "environment_two" {
  type    = string
  default = "Production"
}

variable "repository_ref_branch" {
  type = string
}

variable "registry_url" {
  type = string
}

variable "docker_id" {
  type = string
}

variable "docker_password" {
  type = string
}

variable "registry_type" {
  type = string
}
