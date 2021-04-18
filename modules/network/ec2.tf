#Instâncias públicas

resource "aws_instance" "vpc_a_pub_1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.vpc-public-subnet-a[0].id
  vpc_security_group_ids     = [aws_security_group.sec-group-vpc-a-tcp.id, aws_security_group.sec-group-vpc-a-icmp.id, aws_security_group.sec-group-vpc-a-ike.id]
  key_name                    = aws_key_pair.ingress-keypair.key_name
  private_ip                  = "10.10.11.10"

  tags = {
    Name = format("%s-vpc_a_pub_1",var.infra_name)
  }

  depends_on = [
    aws_vpc.infra_vpc_a
  ]
}

resource "aws_instance" "vpc_b_pub_1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.vpc-public-subnet-b[0].id
  vpc_security_group_ids     = [aws_security_group.sec-group-vpc-b-tcp.id, aws_security_group.sec-group-vpc-b-icmp.id]
  key_name                    = aws_key_pair.ingress-keypair.key_name
  private_ip                  = "10.20.11.10"

  tags = {
    Name = format("%s-vpc_b_pub_1",var.infra_name)
  }

  depends_on = [
    aws_vpc.infra_vpc_b
  ]
}

resource "aws_instance" "vpc_c_pub_1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.vpc-public-subnet-c[0].id
  vpc_security_group_ids     = [aws_security_group.sec-group-vpc-c-tcp.id, aws_security_group.sec-group-vpc-c-icmp.id]
  key_name                    = aws_key_pair.ingress-keypair.key_name
  private_ip                  = "10.30.11.10"

  tags = {
    Name = format("%s-vpc_c_pub_1",var.infra_name)
  }

  depends_on = [
    aws_vpc.infra_vpc_c
  ]
}
##############################################################################

#Instâncias privadas

resource "aws_instance" "vpc_a_priv_1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.vpc-private-subnet-a[0].id
  vpc_security_group_ids     = [aws_security_group.sec-group-vpc-a-tcp.id, aws_security_group.sec-group-vpc-a-icmp.id]
  key_name                    = aws_key_pair.ingress-keypair.key_name
  private_ip                  = "10.10.21.10"

  tags = {
    Name = format("%s-vpc_a_priv_1",var.infra_name)
  }

  depends_on = [
    aws_vpc.infra_vpc_a
  ]
}

resource "aws_instance" "vpc_b_priv_1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.vpc-private-subnet-b[0].id
  vpc_security_group_ids     = [aws_security_group.sec-group-vpc-b-tcp.id, aws_security_group.sec-group-vpc-b-icmp.id]
  key_name                    = aws_key_pair.ingress-keypair.key_name
  private_ip                  = "10.20.21.10"

  tags = {
    Name = format("%s-vpc_b_priv_1",var.infra_name)
  }

  depends_on = [
    aws_vpc.infra_vpc_b
  ]
}

resource "aws_instance" "vpc_c_priv_1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.vpc-private-subnet-c[0].id
  vpc_security_group_ids     = [aws_security_group.sec-group-vpc-c-tcp.id, aws_security_group.sec-group-vpc-c-icmp.id]
  key_name                    = aws_key_pair.ingress-keypair.key_name
  private_ip                  = "10.30.21.10"

  tags = {
    Name = format("%s-vpc_c_priv_1",var.infra_name)
  }

  depends_on = [
    aws_vpc.infra_vpc_c
  ]
}
