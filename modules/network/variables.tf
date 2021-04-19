#Variáveis comuns

variable "aws_region" {}

variable "infra_name" {}

variable "subnet_azs" {
  description = "Região das subnets. Em cada VPC serão 3 subnets por AZ: Pública, Privada e Database"
  default = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
}

variable "ingress_port_tcp"{
  description = "Portas inbound liberadas"
  default = [22,80,443]
}

variable "ingress_port_udp"{
  description = "Portas inbound liberadas - Protocolo IKE"
  default = [500,4500]
}

variable "ami"{
  description = "AMI Ubuntu 20.04"
  default = "ami-0ca5c3bd5a268e7db"
}

variable "instance_type"{
  description = "Tipo das instâncias"
  default = "t2.micro"
}

variable "public_key"{
  description = "Public key de acesso às instâncias públicas"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpuAcCDGl/ONwyusp4q34RVPA5py/1Acj6zPHQcMnPJsbAajg5qpEunxncmPio35Qf1Q5HcVxpK2IpSRVJUH3C8n8EUWPvOZIBApfTcGumUO1UhTQr7lv/3Jthpn3jYivLYk8RsRj55noW/HbWVesEnitWQmAIhi169t/yAknPH6cyXImJe6o6WfbMU/6h8iZ7XLYbt8AmcXRK0oUgY9m9TFvQHVW2SOdhNzI+LI+YeBovNV+esDDMb7s7fpo+dFolubslyhbOlt09W7iLIDvUh+/1ooYtt5NOGDlQlbgEQqpVnd5xuL/8mU144VGvrJT1NbRLKf4VRHa5jfe4GTh7 annagtaraujo@BRRIOWN021449"
}
#######################################################################################

#Variáveis da VPC A

variable "cidr_block_a" {
  default = "10.10.0.0/16"
}

variable "public_subnets_a"{
  default = ["10.10.11.0/24","10.10.12.0/24","10.10.13.0/24","10.10.14.0/24"]
}

variable "private_subnets_a"{
  default = ["10.10.21.0/24","10.10.22.0/24","10.10.23.0/24","10.10.24.0/24"] 
}

variable "database_subnets_a"{
  default = ["10.10.31.0/24","10.10.32.0/24","10.10.33.0/24","10.10.34.0/24"]
}
#######################################################################################3

#Variáveis da VPC B

variable "cidr_block_b" {
  default = "10.20.0.0/16"
}

variable "public_subnets_b"{
  default = ["10.20.11.0/24","10.20.12.0/24","10.20.13.0/24","10.20.14.0/24"]
}

variable "private_subnets_b"{
  default = ["10.20.21.0/24","10.20.22.0/24","10.20.23.0/24","10.20.24.0/24"] 
}

variable "database_subnets_b"{
  default = ["10.20.31.0/24","10.20.32.0/24","10.20.33.0/24","10.20.34.0/24"]
}
#######################################################################################3

#Variáveis da VPC C

variable "cidr_block_c" {
  default = "10.30.0.0/16"
}

variable "public_subnets_c"{
  default = ["10.30.11.0/24","10.30.12.0/24","10.30.13.0/24","10.30.14.0/24"]
}

variable "private_subnets_c"{
  default = ["10.30.21.0/24","10.30.22.0/24","10.30.23.0/24","10.30.24.0/24"] 
}

variable "database_subnets_c"{
  default = ["10.30.31.0/24","10.30.32.0/24","10.30.33.0/24","10.30.34.0/24"]
}
