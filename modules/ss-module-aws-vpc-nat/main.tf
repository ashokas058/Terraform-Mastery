resource "aws_nat_gateway" "NAT" {
  allocation_id = var.eip_id
  subnet_id =var.subnet_id
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name = "${var.project}-NAT-${var.environment}"
    Last_tf_change=var.last_tf_change
    Note=var.nat.note
  }
}