# Author  - John Knepper
# Date    -  May 10, 2016
# File    -  terraform/route53/endpoints.tf
# This file creates all route53 endpoints for COM or CO for use with Druid

resource "aws_route53_record" "zookeeper" {
   zone_id = "${var.zone_id}"
   name = "druid-zookeeper.${var.domain_name}.${var.tld}"
   type = "CNAME"
   ttl = "300"
   records = ["${var.zookeeper_dns_name}"]
}

resource "aws_route53_record" "postgres" {
   zone_id = "${var.zone_id}"
   name = "druid-postgres.${var.domain_name}.${var.tld}"
   type = "CNAME"
   ttl = "300"
   records = ["${var.postgres_dns_name}"]
}

