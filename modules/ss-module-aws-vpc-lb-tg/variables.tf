variable "tg_port" {type = number}
#variable "http_arn" {type = string}
#variable "https_arn" {type = string}

variable "tg" {
  type = object({
    project   = string
    domain = object({
      path   = string
      domain = string
    })
    note     = string
    priority = number
    path                = string
    matcher             = number
    interval            = number
    timeout             = number
    unhealthy_threshold = number
    healthy_threshold   = number
  })

  validation {
    condition = length(var.tg.project)>1
    error_message = "project- variable inputs minimum length error"
  }
  validation {
    condition = length(var.tg.path)>1
    error_message = "health-check -variable inputs minimum length error"
  }

  validation {
    condition = var.tg.priority>0
    error_message = "priority -variable inputs minimum length error"
  }

  validation {
    condition = length(var.tg.domain.domain)>1 && var.tg.domain.path=="/"|| length(var.tg.domain.path)>0
    error_message = "domain -variable inputs minimum length error"
  }

  validation {
    condition = length(var.tg.project)>1
    error_message = "project- variable inputs minimum length error"
  }

}

variable "vpc_id" {
  type = string
  validation {
    condition = length(var.vpc_id)>1
    error_message = "vpc_id- variable inputs minimum length error"
  }
}

variable "environment" {
  type = string
  validation {
    condition = length(var.environment)>1
    error_message = "environment- variable inputs minimum length error"
  }
}
variable "last_tf_change" {
  type = string
  validation {
    condition = length(var.last_tf_change)>1
    error_message = "last_tf_chang- variable inputs minimum length error"
  }
}

