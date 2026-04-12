variable "instance_names" {
  type    = list(string)
  default = ["mongodb", "redis", "nodejs", "frontend"]
}

variable "instance_map" {
  type = map(string)
  default = {
    mongodb  = "t3.small"
    redis    = "t3.micro"
    nodejs   = "t3.small"
    frontend = "t3.micro"
  }
}
