variable "ingress_ports_list" {
  type    = list(number)
  default = [22, 80, 443]

}

variable "ingress_ports_map" {
  default = [ # list(map)
    {
      from_port = 22
      to_port   = 22
	  cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 80
      to_port   = 80
	  cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 8080
      to_port   = 8080
	  cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
