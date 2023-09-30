output "targetgroup_arn" {
  value = aws_lb_target_group.resource.arn
}

output "targetgroup_name" {
  value = aws_lb_target_group.resource.name
}