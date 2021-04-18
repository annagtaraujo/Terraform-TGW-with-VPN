resource "aws_security_group" "sec-group-vpc-a-tcp" {
  name        = "sec-group-vpc-a-ssh-http-https"
  description = "Allow SSH, HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.infra_vpc_a.id

  dynamic ingress {
      iterator = port
      for_each = var.ingress_port_tcp
      content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec-group-vpc-a-ssh-http-https"
    #scenario = "${var.scenario}"
  }
}

resource "aws_security_group" "sec-group-vpc-a-icmp" {
  name        = "sec-group-vpc-a-all-icmp"
  description = "Allow all ICMP traffic"
  vpc_id      = aws_vpc.infra_vpc_a.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec-group-vpc-a-all-icmp"
    #scenario = "${var.scenario}"
  }
}

resource "aws_security_group" "sec-group-vpc-a-ike" {
  name        = "sec-group-vpc-a-ike"
  description = "Allow IKE for VPN traffic"
  vpc_id      = aws_vpc.infra_vpc_a.id

  dynamic ingress {
      iterator = port
      for_each = var.ingress_port_udp
      content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "udp"
        cidr_blocks = ["186.22.56.0/24"] #meu ip público local
        }
  }

  dynamic egress {
      iterator = port
      for_each = var.ingress_port_udp
      content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "udp"
        cidr_blocks = ["0.0.0.0/0"]
        }
  }

  tags = {
    Name = "sec-group-vpc-a-ike"
    #scenario = "${var.scenario}"
  }
}
############################################################################

#Security group VPC B

resource "aws_security_group" "sec-group-vpc-b-tcp" {
  name        = "sec-group-vpc-b-ssh-http-https"
  description = "Allow SSH, HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.infra_vpc_b.id

  dynamic ingress {
      iterator = port
      for_each = var.ingress_port_tcp
      content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec-group-vpc-b-ssh-http-https"
  }
}

resource "aws_security_group" "sec-group-vpc-b-icmp" {
  name        = "sec-group-vpc-b-all-icmp"
  description = "Allow all ICMP traffic"
  vpc_id      = aws_vpc.infra_vpc_b.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec-group-vpc-b-all-icmp"
  }
}
########################################################################

#Security Group VPC C

resource "aws_security_group" "sec-group-vpc-c-tcp" {
  name        = "sec-group-vpc-c-ssh-http-https"
  description = "Allow SSH, HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.infra_vpc_c.id

  dynamic ingress {
      iterator = port
      for_each = var.ingress_port_tcp
      content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec-group-vpc-c-ssh-http-https"
  }
}

resource "aws_security_group" "sec-group-vpc-c-icmp" {
  name        = "sec-group-vpc-c-all-icmp"
  description = "Allow all ICMP traffic"
  vpc_id      = aws_vpc.infra_vpc_c.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec-group-vpc-c-all-icmp"
  }
}
