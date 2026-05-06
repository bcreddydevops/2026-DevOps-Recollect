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
