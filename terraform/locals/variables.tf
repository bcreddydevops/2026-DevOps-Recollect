variable "environment" {
  default = "dev"
}

variable "project" {
  default = "fruitshop"
}

variable "instance_names" {
  default = ["mongodb", "redis", "frontend"]
}

variable "instance_type_map" {
  default = {
    dev  = "t3.micro"
    prod = "t3.small"
  }
}
