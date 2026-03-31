resource "aws_instance" "MyDemoEC2Instance" {
  ami             = "ami-0c3389a4fa5bddaad" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type   = "t3.micro"
  key_name        = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.BCReddySG-Demo.id]
  

  tags = {
    Name = "MyDemoEC2Instance"
  }

}


resource "aws_security_group" "BCReddySG-Demo" {
  name        = "BCReddySG-Demo"
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
    Name = "BCReddySG-Demo"
  }
}
