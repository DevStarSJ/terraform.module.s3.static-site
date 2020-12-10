data "aws_route53_zone" "selected" {
  name         = var.domain_name
}

resource "aws_route53_record" "default" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.name
  type    = "A"

  alias {
    name                   = "s3-website-ap-northeast-1.amazonaws.com"
    zone_id                = var.s3_website_endpoint_route53_hosted_zone_id
    evaluate_target_health = false
  }
}
