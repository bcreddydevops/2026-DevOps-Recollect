Provisioners are used to run scripts or commands after creating resources in Terraform
Terraform creates EC2 instance → after that we want to install nginx → we use provisioners
Provisioners can Run only resource Creation and Destroy .  Not during the update .
Provisioners are last step — after resource creation
local-exec ->Runs on your local machine
remote-exec ->Runs inside the EC2/server


## Keep PEM file in same folder ##
```
provider.tf
sg.tf
ec2-remote-exec.tf
outputs.tf
bcreddydevops-KP.pem
chmod 400 bcreddydevops-KP.pem
terraform init
terraform validate
terraform plan
terraform apply
```
