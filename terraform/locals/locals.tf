locals {

  # Naming convention
  name_prefix = "${var.project}-${var.environment}"

  # Dynamic instance type based on environment
  instance_type = lookup(var.instance_type_map, var.environment, "t3.micro")

  # Common tags (reusable)
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }

  # Merge with extra tag
  final_tags = merge(local.common_tags, {
    Owner = "DevOps-Team"
  })

  # Create formatted names
  instance_full_names = [
    for name in var.instance_names :
    "${local.name_prefix}-${name}"
  ]

  # Count
  instance_count = length(var.instance_names)
}

