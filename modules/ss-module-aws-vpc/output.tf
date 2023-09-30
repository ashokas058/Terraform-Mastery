
#-----------------------------------------------
output "id" {
  value = aws_vpc.resource.id
}

output "pub_subnet" {
  value =aws_subnet.pub-subnets[0].id
}


output "pub_subnets" {
  value = aws_subnet.pub-subnets[*].id
}
output "prvt_subnets" {
  value =aws_subnet.priv-subnets[*].id
}
