resource "aws_vpc" "resource" {
  cidr_block	= var.vpc.cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name = "${var.vpc.project}-VPC-${var.environment}"
    Last_tf_change=var.last_tf_change
    Note=var.vpc.note
  }

}

resource "aws_subnet" "priv-subnets" {
  count 			  = 3
  availability_zone = element(data.aws_availability_zones.az.names,count.index)
  vpc_id	 		  = aws_vpc.resource.id
  cidr_block 		  = element(var.vpc.subnet.private,count.index)

  tags = {
    Name = "${var.vpc.project}-PRV-SUB"
    Tier = "Private"
  }
}
resource "aws_subnet" "pub-subnets" {
  count 			  = 3
  availability_zone = element(data.aws_availability_zones.az.names,count.index)
  vpc_id			  = aws_vpc.resource.id
  cidr_block 		  = element(var.vpc.subnet.public,count.index)

  tags = {
    Name = "${var.vpc.project}-PUB-SUB"
    TIer = "Public"
  }
}