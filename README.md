# Terraform for Azure DevOps portal

### Initialize terraform

```
terraform init
```

### Make a plan

```
terraform plan -out main.tfplan -var-file=secret.tfvars
```

### Apply changes

```
terraform apply.
```

### Following env vars are required

```
azuredevops_pat_token  = ""
orgazation_service_url = ""
service_endpoint_name  = ""
client_id              = ""
client_secret          = ""
tenant_id              = ""
subscription_id        = ""
subscription_name      = ""
project_name           = ""
default_repository_name = ""
auto_reviewers          = "id of the user who wants to be approver"
```
