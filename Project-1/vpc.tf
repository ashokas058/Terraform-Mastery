module "aws_vpc" {
  source = "../modules/ss-module-aws-vpc"
  vpc    =var.vpc
  environment =var.environment
  last_tf_change =var.modifiedby

}

module "aws_igw" {
  depends_on = [module.aws_vpc]
 source = "../modules/ss-module-aws-vpc-igw"
  environment =var.environment
  last_tf_change = var.modifiedby
  note = var.vpc_igw.note
  project =var.vpc.project
  vpc_id =module.aws_vpc.id

}
module "aws_eip" {
  source = "../modules/ss-module-aws-vpc-eip"
  eip    =var.vpc_eip
  environment = var.environment
  last_tf_change =var.modifiedby
  project = var.vpc.project

}
module "aws_nat" {
  source = "../modules/ss-module-aws-vpc-nat"
  eip_id = module.aws_eip.id
  environment = var.environment
  last_tf_change = var.modifiedby
  nat = var.vpc_nat
  project = var.vpc.project
  subnet_id = module.aws_vpc.pub_subnet

}

module "aws_route_tbl" {
  source = "../modules/ss-module-aws-vpc-rt"
  depends_on = [module.aws_vpc,module.aws_nat,module.aws_igw]
  environment = var.environment
  last_tf_change = var.modifiedby
  project =var.vpc.project
  route_tbl =var.vpc_route_tbl
  routes_assoc ={
    routes_pub=[
      {gateway_id=module.aws_igw.id,cidr_block="0.0.0.0/0" }
    ],
    routes_pvt=[
      {gateway_id=module.aws_nat.id,cidr_block="0.0.0.0/0"}
    ],
    routes_pub6=[
      {gateway_id=module.aws_igw.id,ipv6_cidr_block="::/0"}
    ]
  }
  subnet_association_priv =module.aws_vpc.prvt_subnets
  subnet_association_pub =module.aws_vpc.pub_subnets
  vpc_id = module.aws_vpc.id
}

module "aws_lb" {
 source = "../modules/ss-module-aws-vpc-lb"
  environment = var.environment
  last_tf_change = var.modifiedby
  lb = var.vpc_lb
  project =var.vpc.project
  pub_subnets =module.aws_vpc.pub_subnets
  vpc_id = module.aws_vpc.id

}


