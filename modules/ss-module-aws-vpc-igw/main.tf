resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "${var.project}-IG-${var.environment}"
    Last_tf_change=var.last_tf_change
    Note=var.note
  }
}