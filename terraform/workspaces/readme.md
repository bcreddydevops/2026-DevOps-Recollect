Terraform workspace helps us manage multiple state files using the same Terraform code.

For example, we can have dev workspace and prod workspace.

When I select dev workspace and apply, Terraform creates dev infrastructure.

When I select prod workspace and apply, Terraform creates prod infrastructure.

The important point is: workspace separates state, not code.

Here I am using terraform.workspace to dynamically get the current workspace name.

If workspace is dev, resource names will become moneyapp-dev-mongodb and moneyapp-dev-redis.

If workspace is prod, names will become moneyapp-prod-mongodb and moneyapp-prod-redis.

Also, I am using a condition in locals.

If workspace is prod, instance type will be t3.small.

Otherwise, instance type will be t3.micro.

This is how we can create environment-specific infrastructure using Terraform workspaces

Note: Always run terraform workspace show before applying.
Terraform workspace means same code, different state, different environment.

## Workspace Commands ##
Check current workspace
```
terraform workspace show
```
By default, it shows: default

## List workspaces
```
terraform workspace list
```
## Create DEV workspace
```
terraform workspace new dev
```
## Apply DEV infrastructure
```
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```
Created resources
```
moneyapp-dev-mongodb
moneyapp-dev-redis
moneyapp-allow-all-dev
```
Instance type :t3.micro

## Create PROD workspace
```
terraform workspace new prod
```
Or if already created
```
terraform workspace select prod
```
## Apply PROD infrastructure
```
terraform plan
terraform apply -auto-approve
```
Created resources
```
moneyapp-prod-mongodb
moneyapp-prod-redis
moneyapp-allow-all-prod
```
Instance type :t3.small

## Switch back to DEV
```
terraform workspace select dev
terraform workspace show
```
## Destroy DEV
```
terraform workspace select dev
terraform destroy -auto-approve
```
## Destroy PROD
```
terraform workspace select prod
terraform destroy -auto-approve
```

