resource "aws_instance" "MyDemoEC2Instance" {
  ami                    = var.ami_id # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type          = var.environment == "development" ? "t3.micro" : "t3.small"
  key_name               = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.BCReddySG_Demo.id]


  tags = var.ec2_tags

}


resource "aws_security_group" "BCReddySG_Demo" {
  name        = var.sg_name
  description = var.sg_description

  ingress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}
