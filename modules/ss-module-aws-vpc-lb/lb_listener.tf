resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_alb.resource.arn
  port              = "80"
  protocol          = "HTTP"
  lifecycle {
    prevent_destroy = false
  }
  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_alb.resource.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn = data.aws_acm_certificate.details.arn

  lifecycle {
    prevent_destroy = false
  }
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Reached to LB"
      status_code  = "200"
    }
  }
}