variable "project" {
  type    = string
  default = "moneyapp"
}

variable "environment" {
  type = string
}

variable "common_tags" {
  type = map(string)

  default = {
    Project   = "moneyapp"
    Terraform = "true"
  }
}

variable "sg_name" {
  type    = string
  default = "allow-all"
}

variable "sg_description" {
  type    = string
  default = "Allowing all ports from all IPs for demo"
}

variable "instances" {
  type    = list(string)
  default = ["mongodb", "redis"]
}

variable "from_port" {
  type    = number
  default = 0
}

variable "to_port" {
  type    = number
  default = 0
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "ami_id" {
  type        = string
  default     = "ami-0c3389a4fa5bddaad"
  description = "AMI ID"
}

variable "instance_type" {
  type = string
}
