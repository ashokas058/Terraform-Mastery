locals {
  tcp_in=[80,443]
}

resource "aws_security_group" "alb" {
  name        = "${var.project}-SG-${var.environment}"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = local.tcp_in
    content {
      description      = "TLS from VPC"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.project}-SG-${var.environment}"
    Type="tg_${var.environment}"
    last_tf_change_by=var.last_tf_change
    Note=var.lb.note
  }
}