resource "aws_instance" "local_demo" {
  ami                    = "ami-0c3389a4fa5bddaad"
  instance_type          = "t3.micro"
  key_name               = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  tags = {
    Name = "Local-Exec-Demo"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "echo EC2 Created Successfully > output.txt"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo Deleting the EC2 instance > output.txt" 
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo. > inventory.ini"
  }
}
