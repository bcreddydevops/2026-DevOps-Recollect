output "count_instance_ids" {
  value = aws_instance.count_demo[*].id
}
