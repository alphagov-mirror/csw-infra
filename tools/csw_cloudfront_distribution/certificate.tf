resource "aws_acm_certificate" "cf_cert" {
  region            = "us-east-1"
  domain_name       = "${local.target_url}"
  validation_method = "DNS"

  tags = {
    Environment = "${var.env}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

/*
exports
domain_validation_options
domain_name - The domain to be validated
resource_record_name - The name of the DNS record to create to validate the certificate
resource_record_type - The type of DNS record to create
resource_record_value - The value the DNS record needs to have
*/

resource "aws_route53_record" "cert_validation_record" {
  count   = "${length(aws_acm_certificate.cf_cert.domain_validation_options)}"
  zone_id = "${data.terraform_remote_state.dns_zone.zone_id}"
  name    = "${lookup(aws_acm_certificate.cf_cert.domain_validation_options[count.index], "resource_record_name")}"
  type    = "${lookup(aws_acm_certificate.cf_cert.domain_validation_options[count.index], "resource_record_type")}"
  ttl     = "3600"

  records = [
    "${lookup(aws_acm_certificate.cf_cert.domain_validation_options[count.index], "resource_record_value")}"
  ]
}