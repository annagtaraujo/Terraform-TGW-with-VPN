resource "aws_ec2_transit_gateway_route_table" "tgw_rt_a" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  tags               = {
    Name             = "Route-Table-TGW-A"
  }
  depends_on = [aws_ec2_transit_gateway.tgw]
}

resource "aws_ec2_transit_gateway_route_table" "tgw_rt_b" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  tags               = {
    Name             = "Route-Table-TGW-B"
  }
  depends_on = [aws_ec2_transit_gateway.tgw]
}

resource "aws_ec2_transit_gateway_route_table" "tgw_rt_c" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  tags               = {
    Name             = "Route-Table-TGW-C"
  }
  depends_on = [aws_ec2_transit_gateway.tgw]
}

resource "aws_ec2_transit_gateway_route_table" "tgw_rt_vpn" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  tags               = {
    Name             = "Route-Table-TGW-VPN"
  }
  depends_on = [aws_ec2_transit_gateway.tgw, aws_vpn_connection.vpn_connection]
}
################################################################

#Rotas

resource "aws_ec2_transit_gateway_route" "vpn_static_route_in_rt_vpn_teste" {
  destination_cidr_block         = "192.168.0.0/16" #Na tabela, o endereço propagado para a VPC A deve ser o privado
  transit_gateway_attachment_id  = aws_vpn_connection.vpn_connection.transit_gateway_attachment_id #tgw assoc de destino
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_a.id #tabela com a rota adicionada

  depends_on = [aws_ec2_transit_gateway.tgw, aws_vpn_connection.vpn_connection]
}

resource "aws_ec2_transit_gateway_route" "private_vpc_a_in_rt_vpn_teste" {
  destination_cidr_block         = "10.10.0.0/16" #Coloco o endereço de A para que a VPN saiba chegar
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a_pb.id #tgw assoc de destino
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_vpn.id #tabela com a rota adicionada

  depends_on = [aws_ec2_transit_gateway.tgw, aws_vpn_connection.vpn_connection]
}
################################################################

#TGW Route Table association com as VPCs

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rt_a_vpc_a_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a_pb.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_a.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a_pb]
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rt_b_vpc_b_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_b_pb.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_b.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_b_pb]
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rt_c_vpc_c_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_c_pb.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_c.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_c_pb]
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rt_vpn_assoc" {
  transit_gateway_attachment_id  = aws_vpn_connection.vpn_connection.transit_gateway_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_vpn.id

  depends_on = [aws_ec2_transit_gateway.tgw, aws_vpn_connection.vpn_connection]
}
################################################################

#TGW Route Table propagation com as VPCs

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_rt_b_pb_to_vpc_a" { #B fala com A
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a_pb.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_b.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a_pb]
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_rt_c_pb_to_vpc_a" { #C fala com A
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a_pb.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_c.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a_pb]
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_rt_a_pb_to_vpc_b" { #A fala com B
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_b_pb.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_a.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_b_pb]
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_rt_a_pb_to_vpc_c" { #A fala com C
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_c_pb.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_a.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_c_pb]
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_rt_vpn_to_vpc_a" { #A fala com VPN
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a_pb.id 
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_vpn.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a_pb]
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_rt_a_to_vpn" { #VPN fala com A
  transit_gateway_attachment_id  = aws_vpn_connection.vpn_connection.transit_gateway_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_a.id

  depends_on = [aws_ec2_transit_gateway.tgw, aws_vpn_connection.vpn_connection]
}
