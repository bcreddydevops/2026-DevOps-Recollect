output "merged_tags" {
  value = local.final_tags
}

output "env_upper" {
  value = local.env_upper
}

output "env_lower" {
  value = local.env_lower
}

output "joined_names" {
  value = local.instance_names_joined
}

output "split_names" {
  value = local.split_names
}

output "instance_count" {
  value = local.instance_count
}

output "lookup_instance_type" {
  value = local.instance_type
}

output "first_instance" {
  value = local.first_instance
}

output "all_instances" {
  value = local.all_instances
}
