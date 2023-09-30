data "aws_lb" "lb" {
name=var.lb_name
}
data "aws_lb_listener" "http" {
  depends_on = [data.aws_lb.lb]
  port = 80
  load_balancer_arn = data.aws_lb.lb.arn
}

data "aws_acm_certificate" "details" {
  domain = var.domain
}