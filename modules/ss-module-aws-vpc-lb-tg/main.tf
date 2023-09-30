#Target group creation
resource "aws_lb_target_group" "resource" {
  name        ="tg-${var.tg.project}"
  port        =var.tg_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  health_check {
    path                = var.tg.path
    protocol            = "HTTP"
    matcher             = var.tg.matcher
    interval            = var.tg.interval
    timeout             = var.tg.timeout
    unhealthy_threshold = var.tg.unhealthy_threshold
    healthy_threshold   = var.tg.healthy_threshold
  }
  tags = {
    Name = "${var.tg.project}-${var.environment}"
    Type="tg_${var.environment}"
    last_tf_change_by=var.last_tf_change
    Note=var.tg.note

  }
  lifecycle {
    create_before_destroy = true
  }
}



