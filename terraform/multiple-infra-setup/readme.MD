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
