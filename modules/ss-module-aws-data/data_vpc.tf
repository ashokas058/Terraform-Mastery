locals {
  subnet_ids =var.public_subnets
}

data "aws_availability_zones" "az" {}

data "aws_vpc" "details" {
  filter {
    name = "tag:Name"
    values=["${var.project}-VPC-${var.environment}"]
  }
}

data "aws_subnets" "public" {
  tags = {
    Tier = "Public"
    Name = "${var.project}-PUB-SUB"
  }
}

data "aws_subnets" "private" {

  tags = {
    Tier = "Private"
    Name = "${var.project}-PRV-SUB"
  }
}

data "aws_eip" "details" {
  tags = {
    Name="${var.project}-EIP-${var.environment}"
  }
}


data "aws_internet_gateway" "details" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
  tags = {
    Name = "${var.project}-IG-${var.environment}"
  }
}

data "aws_nat_gateway" "details" {
  tags = {
    Name = "${var.project}-NAT-${var.environment}"
  }
}

data "aws_route_table" "public" {

  tags = {
    Name = "${var.project}-PUB_RT-${var.environment}"
  }
}


data "aws_route_table" "private" {

  tags = {
    Name = "${var.project}-PVT_RT-${var.environment}"
  }
}
