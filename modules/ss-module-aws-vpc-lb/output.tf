
output "https_arn" {
  value =aws_lb_listener.https.arn
}
output "http_arn" {
  value = aws_lb_listener.http.arn
}
output "dns_name" {
  value =aws_alb.resource.dns_name
}
output "zone_id" {
  value = aws_alb.resource.zone_id
}
