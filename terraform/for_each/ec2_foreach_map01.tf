resource "aws_instance" "foreach_map_demo" {
  for_each               = var.instance_map
  ami                    = "ami-0c3389a4fa5bddaad" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type          = each.value
  key_name               = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.main_sg.id]

  tags = {
    Name = each.key
  }
}
