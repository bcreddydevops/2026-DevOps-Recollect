resource "aws_route53_record" "www_private" {
  count   = 4
  zone_id = var.zone_id
  # interpolation
  name    = "${var.instances[count.index]}.${var.domain_name}" # mongodb.bcreddydevops.online, redis.bcreddydevops.online, mysql.bcreddydevops.online, frontend.bcreddydevops.online
  type    = "A"
  ttl     = 1
  records = [aws_instance.demoshop[count.index].private_ip]
}

# xeroxshop.bcreddydevops.online -> public_ip
# As part of functions
resource "aws_route53_record" "www_public" {
  zone_id = var.zone_id
  # interpolation
  name    = "xeroxshop.${var.domain_name}" # xeroxshop.bcreddydevops.online
  type    = "A"
  ttl     = 1
  records = [aws_instance.demoshop[index(var.instances, "frontend")].public_ip]
}
