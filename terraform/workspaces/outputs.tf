output "current_workspace" {
  value = terraform.workspace
}

output "environment" {
  value = local.environment
}

output "instance_type" {
  value = local.instance_type
}

output "instance_names" {
  value = aws_instance.moneyapp[*].tags.Name
}

output "instance_public_ips" {
  value = aws_instance.moneyapp[*].public_ip
}

output "security_group_name" {
  value = aws_security_group.demo_sg.name
}
