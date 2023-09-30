variable "https_arn" {type = string}
variable "tg_arn" {type = string}
variable "last_tf_change" {type = string}
variable "environment" {type = string}

variable "enable_forward" {type = bool}
variable "rule" {
  type = object({
    domain  = object({
      path   = string
      forward_path=string
      domain = string
      priority=number
    })
    note=string
  })
}