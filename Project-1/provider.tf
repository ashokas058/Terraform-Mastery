provider "aws" {
  profile = var.profile
  region  = var.aws_region
}
#--------------external variables -Managed in ./Project/env/prod-env/

variable "aws_region" {}
variable "modifiedby" {}
variable "environment" {}
variable "profile" {}

terraform {
  backend "s3" {
    bucket = "terraform-ashok-test"
    region = "us-east-1"
    key="terraform.tfstate"
  }
}