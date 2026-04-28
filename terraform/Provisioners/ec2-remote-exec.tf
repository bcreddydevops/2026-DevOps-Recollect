resource "aws_instance" "remote_demo" {
  ami                    = "ami-0c3389a4fa5bddaad"
  instance_type          = "t3.micro"
  key_name               = "bcreddydevops-KP"
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  tags = {
    Name = "Remote-Exec-Demo"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("bcreddydevops-KP.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "echo '<h1>Welcome to BCReddyDevOps</h1><h2>Terraform Remote-Exec Provisioner Demo</h2>' | sudo tee /usr/share/nginx/html/index.html"
    ]
  }

  provisioner "remote-exec" {
    when = destroy

    inline = [
      "sudo systemctl stop nginx || true",
      "echo 'NGINX stopped before destroying EC2'"
    ]
  }
}
