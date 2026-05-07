Simple Definition - Module means reusable Terraform code.
Same in Terraform -Instead of writing: EC2 code ,SG code,outputs,variables
again and again…
👉 we create one module and reuse it
Why Modules? 
Without Modules ❌
```
DEV EC2 code
QA EC2 code
PROD EC2 code
```
Duplicate code everywhere.
With Modules ✅
```
One reusable module
Use everywhere
```
🎯 Types of Modules
| Type         | Meaning             |
| ------------ | ------------------- |
| Root Module  | Main Terraform code |
| Child Module | Reusable module     |

🎯 Real-Time Example
We will create:Reusable EC2 Module
Module creates:
Security Group
EC2 Instance
Then we call it for:
DEV
PROD
## 📁 Folder Structure
```
terraform-modules-demo/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
│
└── modules/
    └── ec2-module/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```
## ROOT MODULE
provider.tf
```
provider "aws" {
  region = "us-east-1"
}
```
variables.tf
```
variable "ami_id" {
  default = "ami-0c3389a4fa5bddaad"
}
```
main.tf
DEV module
```
module "dev_app" {
  source = "./modules/ec2-module"

  environment  = "dev"
  instance_name = "mongodb-dev"
  instance_type = "t3.micro"
  ami_id       = var.ami_id
}
```
PROD module 
```
module "prod_app" {
  source = "./modules/ec2-module"

  environment  = "prod"
  instance_name = "mongodb-prod"
  instance_type = "t3.small"
  ami_id       = var.ami_id
}
```
output.tf
```
output "dev_public_ip" {
  value = module.dev_app.public_ip
}

output "prod_public_ip" {
  value = module.prod_app.public_ip
}
```
## MODULE CODE
## modules/ec2-module/variables.tf
```
variable "environment" {}
variable "instance_name" {}
variable "instance_type" {}
variable "ami_id" {}
```
## modules/ec2-module/main.tf
Security Group
```
resource "aws_security_group" "demo_sg" {
  name = "${var.instance_name}-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.instance_name}-sg"
    Environment = var.environment
  }
}
```
EC2 Instance
```
resource "aws_instance" "demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }
}
```
modules/ec2-module/outputs.tf
```
output "public_ip" {
  value = aws_instance.demo.public_ip
}
```
🎯 Commands
```
terraform init
terraform plan
terraform apply -auto-approve
```
🎯 Resources Created
```
mongodb-dev
mongodb-prod
```
