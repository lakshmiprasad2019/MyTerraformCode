output "Publicip" {
  value = aws_instance.web.public_ip
}
output "PrivateIP" {
  value     = aws_instance.web.private_ip
  sensitive = true
}
output "Public_DNS" {
  value = aws_instance.web.public_dns

}
output "mainroutingtableID" {
  value = aws_vpc.myvpc.main_route_table_id
}
