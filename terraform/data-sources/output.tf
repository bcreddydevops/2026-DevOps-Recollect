output "ami_id" {
  value = data.aws_ami.amazon_linux.id
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnet_ids" {
  value = data.aws_subnets.default_subnets.ids
}

output "instance_id" {
  value = aws_instance.demo.id
}

output "azs" {
  value = data.aws_availability_zones.available.names
}
