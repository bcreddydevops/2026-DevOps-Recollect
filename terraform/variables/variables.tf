variable "instance_type" {
  description = "The type of instance to use for the cluster nodes."
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
  default     = "ami-0c3389a4fa5bddaad" # Amazon Linux 2 AMI (HVM), SSD Volume Type

}

variable "ec2_tags" {
  description = "A map of tags to assign to the EC2 instance."
  type        = map(string)
  default = {
    Name        = "MyDemoEC2Instance"
    Environment = "Development"
    Owner       = "BCReddy"
    Purpose     = "Terraform Demo"
  }
}
variable "sg_name" {
  description = "The name of the security group."
  type        = string
  default     = "BCReddySG_Demo"

}

variable "sg_description" {
  type    = string
  default = "Security group for BCReddy Demo"
}

variable "sg_from_port" {
  type    = number
  default = 0
}

variable "sg_to_port" {
  type    = number
  default = 0
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]

}

variable "sg_tags" {
  description = "A map of tags to assign to the security group."
  type        = map(string)
  default = {
    Name        = "BCReddySG_Demo"
    Environment = "Development"
    Owner       = "BCReddy"
    Purpose     = "Terraform Demo"
  }
}
