resource "aws_lb_listener_rule" "forward" {
  count=var.enable_forward?1:0
  listener_arn =var.https_arn
  priority     =var.rule.domain.priority

  #  lifecycle {
  #    ignore_changes =all
  #  }

  action {
    type             = "forward"
    target_group_arn = var.tg_arn
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

resource "aws_lb_listener_rule" "redirect" {
  count=var.enable_forward?0:1
  listener_arn =var.https_arn
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
      path=var.rule.domain.forward_path
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