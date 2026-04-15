variable "common_tags" {
  default = {
    Project     = "fruitshop"
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "instance_name" {
  default = "datasource-demo"
}

variable "key_name" {
  default = "bcreddydevops-KP"
}
