variable "instance_names" {
  type    = list(string)
  default = ["mongodb", "redis", "nodejs", "frontend"]
}

variable "instance_map" {
  type = map(string)
  default = {
    mongodb  = "t2.small"
    redis    = "t3.small"
    nodejs   = "t3.medium"
    frontend = "t3.micro"
  }
}
