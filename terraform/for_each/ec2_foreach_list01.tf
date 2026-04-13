resource "aws_instance" "foreach_list_demo" {
  for_each               = toset(var.instance_names)
  ami                    = "ami-0c3389a4fa5bddaad" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type          = "t3.micro"
  key_name               = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.main_sg.id]

  tags = {
    Name = each.key
  }
}
