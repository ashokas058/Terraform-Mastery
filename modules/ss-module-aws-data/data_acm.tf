
data "aws_acm_certificate" "details" {
  domain = var.domain
}