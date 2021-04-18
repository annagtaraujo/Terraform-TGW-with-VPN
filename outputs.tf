output "psk_tunnel"{
    value = module.network.psk_tunnel
}

#Outputs Instâncias PUblicas da VPC A

output "public_ip_instance_pb_a"{
    description = "IP Público da Instância Publica da VPC A"
    value = module.network.public_ip_instance_pb_a
}

output "private_ip_instance_pb_a"{
    description = "IP Privado da Instância Publica da VPC A"
    value = module.network.private_ip_instance_pb_a
}
#############################################################################

#Outputs Instâncias PUblicas da VPC B

output "public_ip_instance_pb_b"{
    description = "IP Público da Instância Publica da VPC B"
    value = module.network.public_ip_instance_pb_b
}

output "private_ip_instance_pb_b"{
    description = "IP Privado da Instância Publica da VPC B"
    value = module.network.private_ip_instance_pb_b
}
#############################################################################

#Outputs Instâncias PUblicas da VPC C

output "public_ip_instance_pb_c"{
    description = "IP Público da Instância Publica da VPC C"
    value = module.network.public_ip_instance_pb_c
}

output "private_ip_instance_pb_c"{
    description = "IP Privado da Instância Publica da VPC C"
    value = module.network.private_ip_instance_pb_c
}