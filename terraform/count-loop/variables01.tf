variable "instances" {
  type    = list(any)
  default = ["mongodb", "redis", "mysql", "frontend"]
}

# replace with your zone_id and domain_name
variable "zone_id" {
  default = "Z09680353BMZCRKD0D0LG"
}

variable "domain_name" {
  default = "bcreddydevops.online"
}
