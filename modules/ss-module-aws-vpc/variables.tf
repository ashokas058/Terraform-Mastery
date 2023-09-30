variable "vpc" {
  type = object({
    cidr=string
    project=string
    note=string
    subnet=object({
      private=list(string)
      public=list(string)
    })

  })

  validation {
    condition = length(var.vpc.cidr)>1 && length(var.vpc.project)>1 && length(var.vpc.note)>1
    error_message = "vpc- variable inputs minimum length error"
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


