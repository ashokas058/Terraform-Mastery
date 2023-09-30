variable "vpc" {
  default = {
    cidr="10.0.0.0/16"
    project="TestProject-vpc"
    note="created-vpc"
    subnet={
      private=["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
      public=["10.0.6.0/24","10.0.5.0/24","10.0.4.0/24"]
    }
  }
}
#----------------------------------
variable "vpc_igw" {
  type = object({
    note=string
  })
 default = {
   note="added igw"
 }
}

#--------------------------------------

variable "vpc_eip" {
  default = {
    note="eip-added"
  }
}

#--------------------------------------
variable "vpc_nat" {
  default = {
    note="added-nat"
  }
}

#----------------------
variable "vpc_route_tbl" {
  default = {
    note="tbl"
  }
}

#-----------------------

variable "vpc_lb" {
 default={
      note="added-lb"
      domain="nqueens.in"
    }
}

#------------------------


