resource "aws_instance" "bcreddy-ec2" {
  ami                    = "ami-0c3389a4fa5bddaad" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type          = "t3.micro"
  key_name               = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.bcreddy-sg.id]

  tags = {
    Name = "fruitshopapp"
  }

}

resource "aws_security_group" "bcreddy-sg" {
  name        = "fruitshopsg"
  description = "Security group for BCReddy Demo"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
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
