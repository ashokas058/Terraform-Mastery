resource "aws_alb" "resource" {
  name               = var.project
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = var.pub_subnets
  lifecycle {
    prevent_destroy = false
  }
}