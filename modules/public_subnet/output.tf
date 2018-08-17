output "public_subnet_nat_public_ip_out" {
  value = "${module.nat_gateway.eip_public_ip_out}"
}

output "public_subnet_id_out" {
  value = "${aws_subnet.public_subnet.id}"
}

output "public_route_table_id_out" {
  value = "${aws_route_table.public_route_table.id}"
}
