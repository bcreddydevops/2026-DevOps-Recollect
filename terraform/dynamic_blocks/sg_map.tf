resource "aws_security_group" "dynamic_sg" {
  name        = "dynamic-sg-allow-all"
  description = "Security group for BCReddy Demo"

    dynamic "ingress" {
    for_each = var.ingress_ports_map
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = "-1"
      cidr_blocks      = ingress.value["cidr_blocks"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "fruitshop-sg-allow-all"
  }
}
