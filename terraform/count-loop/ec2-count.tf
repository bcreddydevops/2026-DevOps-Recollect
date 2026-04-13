resource "aws_instance" "count_demo" {
  count                  = length(var.instance_names)
  ami                    = "ami-0c3389a4fa5bddaad" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type          = "t3.micro"
  key_name               = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.main_sg.id]

  tags = {
    Name = var.instance_names[count.index]
  }
}



output "count_instance_ids" {
  value = aws_instance.count_demo[*].id
}
