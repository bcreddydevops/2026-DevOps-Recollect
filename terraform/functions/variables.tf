variable "common_tags" {
  default = {
    Project     = "fruitshop"
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "ec2_tags" {
  default = {
    Name        = "functions-demo"
    Environment = "prod"
  }
}

variable "sg_tags" {
  default = {
    Name = "functions-demo-sg"
  }
}

# List Variable
variable "instance_names" {
  default = ["mongodb", "redis", "frontend"]
}

# Map Variable
variable "instance_types" {
  default = {
    mongodb  = "t3.small"
    redis    = "t3.micro"
    frontend = "t3.micro"
  }
}
