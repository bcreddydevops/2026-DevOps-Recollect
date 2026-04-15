resource "aws_security_group" "main_sg" {
  name = "${local.name_prefix}-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

resource "aws_instance" "demo" {
  count                  = local.instance_count
  ami                    = "ami-0c3389a4fa5bddaad"
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  key_name               = "bcreddydevops-KP"

  tags = merge(
    local.final_tags,
    {
      Name = local.instance_full_names[count.index]
    }
  )
}
