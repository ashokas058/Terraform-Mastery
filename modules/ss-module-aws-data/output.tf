output "vpc_id" {
  value = data.aws_vpc.details.id
}
output "alb_listener_arn" {
  value = data.aws_lb_listener.http.arn
}
output "subnet_ids" {
  value = local.subnet_ids
}
output "lamda_role_arn" {
  value = data.aws_iam_role.lamda.arn
}