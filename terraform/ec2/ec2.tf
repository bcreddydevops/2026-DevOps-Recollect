provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "bcreddy_sg" {
  name        = "bcreddy-allow-http-ssh"
  description = "Allow HTTP and SSH access"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH (Restrict in real projects)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ⚠️ Not recommended for production
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "BCReddy-SG"
    Environment = "Development"
  }
}

resource "aws_instance" "demo_ec2" {
  ami                    = "ami-0c3389a4fa5bddaad"
  instance_type          = "t3.micro"
  key_name               = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.bcreddy_sg.id]

  tags = {
    Name        = "DemoEC2"
    Environment = "Development"
  }
}
