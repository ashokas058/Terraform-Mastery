variable "lb_name" {type = string}
variable "public_subnets" {type = list(string)}
variable "lamda_role_name" {type = string}
variable "vpc_name" {type = string}
variable "environment" {type = string}
variable "project" {type = string}
variable "vpc_id" {type = string}

variable "domain" {type = string}