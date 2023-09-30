variable "nat" {
  type = object({
    note=string
  })
}

variable "eip_id" {type = string}
variable "subnet_id" {type = string}

variable "environment" {type = string}
variable "last_tf_change" {type = string}
variable "project" {type = string}