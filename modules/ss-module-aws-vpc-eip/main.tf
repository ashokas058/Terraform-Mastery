resource "aws_eip" "resource" {
  vpc = true
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name="${var.project}-EIP-${var.environment}"
    Last_tf_change=var.last_tf_change
    note=var.eip.note
  }
}