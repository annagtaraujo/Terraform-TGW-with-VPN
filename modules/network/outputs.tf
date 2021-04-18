
output "psk_tunnel"{
    value = module.tgw.psk_tunnel
}

#Outputs Instâncias PUblicas da VPC A

output "cidr_block_vpc_a"{
    description = "Pool da VPC A"
    value = aws_vpc.infra_vpc_a.cidr_block
}

output "public_ip_instance_pb_a"{
    description = "IP Público da Instância Publica da VPC A"
    value = aws_instance.vpc_a_pub_1.public_ip
}

output "private_ip_instance_pb_a"{
    description = "IP Privado da Instância Publica da VPC A"
    value = aws_instance.vpc_a_pub_1.private_ip
}
#############################################################################

#Outputs Instâncias PUblicas da VPC B

output "cidr_block_vpc_b"{
    description = "Pool da VPC B"
    value = aws_vpc.infra_vpc_b.cidr_block
}

output "public_ip_instance_pb_b"{
    description = "IP Público da Instância Publica da VPC B"
    value = aws_instance.vpc_b_pub_1.public_ip
}

output "private_ip_instance_pb_b"{
    description = "IP Privado da Instância Publica da VPC B"
    value = aws_instance.vpc_b_pub_1.private_ip
}
#############################################################################

#Outputs Instâncias PUblicas da VPC C

output "cidr_block_vpc_c"{
    description = "Pool da VPC C"
    value = aws_vpc.infra_vpc_c.cidr_block
}

output "public_ip_instance_pb_c"{
    description = "IP Público da Instância Publica da VPC C"
    value = aws_instance.vpc_c_pub_1.public_ip
}

output "private_ip_instance_pb_c"{
    description = "IP Privado da Instância Publica da VPC C"
    value = aws_instance.vpc_c_pub_1.private_ip
}