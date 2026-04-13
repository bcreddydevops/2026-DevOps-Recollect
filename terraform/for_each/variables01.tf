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

variable "ingress_ports_list" {
  type    = list(number)
  default = [22, 80, 443]
}

variable "ingress_ports_map" {
  type = list(object({
    from_port   = number
    to_port     = number
    cidr_blocks = list(string)
  }))

  default = [
    {
      from_port   = 22
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 8080
      to_port     = 8080
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "zone_id" {
  type    = string
  default = "Z09680353BMZCRKD0D0LG"
}

variable "domain_name" {
  type    = string
  default = "bcreddydevops.online"
}
