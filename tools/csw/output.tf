output "public_subnet_1_id" {
  value = "${module.public_subnet_1.public_subnet_id_out}"
}

output "public_subnet_2_id" {
  value = "${module.public_subnet_2.public_subnet_id_out}"
}

output "public_security_group_id" {
  value = "${aws_security_group.public_security_group.id}"
}

output "bastion_public_ip" {
  value = "${module.jump_subnet.bastion_public_ip_out}"
}

output "nat_1_public_ip" {
  value = "${module.public_subnet_1.nat_public_ip_out}"
}

output "nat_2_public_ip" {
  value = "${module.public_subnet_2.nat_public_ip_out}"
}
