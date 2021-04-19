resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach_vpc_a_pb" {
  subnet_ids = var.subnet_id_pb_a
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id = var.instance_id_a
  tags = {
    Name = "Transit Gateway VPC A Attachment"
  }
  transit_gateway_default_route_table_association = "false"
  transit_gateway_default_route_table_propagation = "false"

  depends_on = [aws_ec2_transit_gateway.tgw]

}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach_vpc_b_pb" {
  subnet_ids = var.subnet_id_pb_b
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id = var.instance_id_b
  tags = {
    Name = "Transit Gateway VPC B Attachment"
  }
  transit_gateway_default_route_table_association = "false"
  transit_gateway_default_route_table_propagation = "false"

  depends_on = [aws_ec2_transit_gateway.tgw]

}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach_vpc_c_pb" {
  subnet_ids = var.subnet_id_pb_c
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id = var.instance_id_c
  tags = {
    Name = "Transit Gateway VPC C Attachment"
  }
  transit_gateway_default_route_table_association = "false"
  transit_gateway_default_route_table_propagation = "false"

  depends_on = [aws_ec2_transit_gateway.tgw]

}
