resource "aws_security_group" "main_sg" {
  name        = "fruitshop-sg"
  description = "Demo SG - Allow All (Not for Production)"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, var.sg_tags)
}

resource "aws_instance" "functions_demo" {
  ami                    = "ami-0c3389a4fa5bddaad"
  instance_type          = local.instance_type
  key_name               = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.main_sg.id]

  tags = merge(var.common_tags,var.ec2_tags)
}
