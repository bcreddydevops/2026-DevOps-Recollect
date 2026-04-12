resource "aws_instance" "foreach_map_demo" {
  for_each               = var.instance_map
  ami                    = "ami-0c3389a4fa5bddaad" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type          = each.value
  key_name               = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.dynamic_sg.id]

  tags = {
    Name = each.key
  }

}

resource "aws_security_group" "dynamic_sg" {
  name        = "dynamic-sg-allow-all"
  description = "Security group for BCReddy Demo"

  dynamic "ingress" {
    for_each = var.ingress_port
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
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
