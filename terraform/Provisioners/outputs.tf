output "remote_demo_public_ip" {
  value = aws_instance.remote_demo.public_ip
}

output "nginx_url" {
  value = "http://${aws_instance.remote_demo.public_ip}"
}
