
variable "project" {
  type = string
  validation {
    condition = length(var.project)>1
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

variable "note" {
  type=string
  validation {
    condition = length(var.note)>1
    error_message = "note- variable inputs minimum length error"
  }
}
