variable "vpc_id" { type = string }
variable "subnet_association_priv" {type=list(string)}
variable "subnet_association_pub" {type = list(string)}

variable "environment" {type = string}
variable "last_tf_change" {type = string}
variable "project" {type = string}


variable "route_tbl" {
  type = object({
    note         = string
  })
}
variable "routes_assoc" {
  type = object({
    routes_pub=list(object({
      gateway_id=string
      cidr_block=string
    }))
    routes_pvt=list(object({
      gateway_id=string
      cidr_block=string
    }))

    routes_pub6=list(object({
      gateway_id=string
      ipv6_cidr_block=string
    }))
  })
}
