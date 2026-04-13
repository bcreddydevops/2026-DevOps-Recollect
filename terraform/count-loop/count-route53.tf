resource "aws_route53_record" "private_ip" {
  count   = length(var.instance_names)
  zone_id = var.zone_id

  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1

  records = [aws_instance.count_demo[count.index].private_ip]
}

resource "aws_route53_record" "public_ip" {
  zone_id = var.zone_id

  name    = "fruitshop.${var.domain_name}"
  type    = "A"
  ttl     = 1

  records = [aws_instance.count_demo[index(var.instance_names, "frontend")].public_ip]
}
