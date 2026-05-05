## Folder Structure ##

```
multi-env-terraform/
├── provider.tf
├── variables.tf
├── ec2.tf
├── outputs.tf
├── dev/
│   ├── backend.tf
│   └── dev.tfvars
└── prod/
    ├── backend.tf
    └── prod.tfvars
```

## DEV Commands ## 

```
terraform init -backend-config=dev/backend.tf
terraform validate
terraform plan -var-file=dev/dev.tfvars
terraform apply -var-file=dev/dev.tfvars -auto-approve
```
## DEV Resources Created ##
```
moneyapp-dev-mongodb
moneyapp-dev-redis
moneyapp-allow-all-dev
```

## PROD Commands ##
```
terraform init -reconfigure -backend-config=prod/backend.tf
terraform validate
terraform plan -var-file=prod/prod.tfvars
terraform apply -var-file=prod/prod.tfvars -auto-approve
```
## PROD Resources Created ##
```
moneyapp-prod-mongodb
moneyapp-prod-redis
moneyapp-allow-all-prod
```

## Destroy Commands ##
Destroy DEV
```
terraform init -reconfigure -backend-config=dev/backend.tf
terraform destroy -var-file=dev/dev.tfvars -auto-approve
```
Destroy PROD
```
terraform init -reconfigure -backend-config=prod/backend.tf
terraform destroy -var-file=prod/prod.tfvars -auto-approve
```

In real-time projects, we usually have multiple environments like DEV, QA, UAT, PROD.
The important point is: we should not duplicate Terraform code for each environment.
Instead, we keep the same Terraform code and pass different variable files.
For DEV, I am passing dev/dev.tfvars.
For PROD, I am passing prod/prod.tfvars.
In DEV, instance type is t3.micro.
In PROD, instance type is t3.small.
Also, we are using separate backend files.
For DEV, state file goes to DEV S3 bucket.
For PROD, state file goes to PROD S3 bucket.
This is very important because DEV and PROD state should not mix.
Now when I run DEV commands, Terraform creates:
moneyapp-dev-mongodb
moneyapp-dev-redis
When I run PROD commands, Terraform creates:
moneyapp-prod-mongodb
moneyapp-prod-redis
So same code, different environments, different state files, different infrastructure.
This is the main advantage of multi-environment Terraform setup.


## Pros ##
```
No duplicate code
Easy to maintain
Consistent infrastructure
Environment-specific values
```
## Cons ##
```
Be very careful while applying PROD
Wrong tfvars can impact wrong environment
Always verify terraform plan before apply
````

