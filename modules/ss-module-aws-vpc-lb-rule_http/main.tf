resource "aws_lb_listener_rule" "http" {
  listener_arn =var.http_arn
  priority     =var.rule.domain.priority
  #  lifecycle {
  #    ignore_changes =all
  #  }
  action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
  condition {
    path_pattern {
      values = [var.rule.domain.path]
    }
  }

  condition {
    host_header {
      values = [var.rule.domain.domain]
    }
  }
  tags = {
    Name ="http:-${var.rule.domain.domain}-${var.environment}"
    Type="http-rule-${var.environment}"
    last_tf_change_by=var.last_tf_change
    Note=var.rule.note
  }
}