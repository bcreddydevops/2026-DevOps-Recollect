locals {

  # merge()
  final_tags = merge(var.common_tags, var.ec2_tags)

  # upper() & lower()
  env_upper = upper(var.common_tags["Environment"])
  env_lower = lower(var.ec2_tags["Environment"])

  # join()
  instance_names_joined = join(",", var.instance_names)

  # split()
  split_names = split(",", local.instance_names_joined)

  # length()
  instance_count = length(var.instance_names)

  # lookup()
  instance_type = lookup(var.instance_types, "mongodb", "t3.micro")

  # element()
  first_instance = element(var.instance_names, 0)

  # concat()
  all_instances = concat(var.instance_names, ["backend"])
}
