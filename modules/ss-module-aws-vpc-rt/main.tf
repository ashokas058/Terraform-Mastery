resource "aws_route_table" "Pub-Route" {
  lifecycle {
    prevent_destroy = false
  }
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.routes_assoc.routes_pub
    content {
      cidr_block=route.value.cidr_block
      gateway_id=route.value.gateway_id
    }
  }
  dynamic "route" {
    for_each = var.routes_assoc.routes_pub6
    content {
      ipv6_cidr_block=route.value.ipv6_cidr_block
      gateway_id=route.value.gateway_id
    }
  }

  tags = {
    Name = "${var.project}-PUB_RT-${var.environment}"
    Last_tf_change=var.last_tf_change
    Note=var.route_tbl.note
  }
}
resource "aws_route_table" "Priv-Route" {
  lifecycle {
    prevent_destroy = false
  }
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.routes_assoc.routes_pvt
    content {
      cidr_block=route.value.cidr_block
      gateway_id=route.value.gateway_id
    }
  }
  tags = {
    Name = "${var.project}-PVT_RT-${var.environment}"
    Last_tf_change=var.last_tf_change
    Note=var.route_tbl.note
  }
}
# module "vpc-subnet" {
#   source = "../vpc-subnet"
# }
# Route table subnets association
resource "aws_route_table_association" "Private-Sub" {
  count = 3
  subnet_id = var.subnet_association_priv[count.index]
  route_table_id = aws_route_table.Priv-Route.id
}
resource "aws_route_table_association" "Public-Sub" {
  count = 3
  subnet_id = var.subnet_association_pub[count.index]
  route_table_id = aws_route_table.Pub-Route.id
}
