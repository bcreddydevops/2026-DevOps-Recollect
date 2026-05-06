locals {
  environment = terraform.workspace

  instance_type = terraform.workspace == "prod" ? "t3.small" : "t3.micro"

  common_tags = merge(
    var.common_tags,
    {
      Environment = local.environment
    }
  )
}
