resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = 65000
  ip_address = "201.231.128.133" #"186.22.56.226"  #IP Público do meu ponto remoto, que será a minha máquina local
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "vpn_connection" {
  customer_gateway_id = aws_customer_gateway.customer_gateway.id
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  type                = "ipsec.1"
  static_routes_only  = true
  tunnel1_preshared_key = "Q1ud42603.x0608199S" 
  
  tags = {
      Name = "Tunnel Banking-To-Home"
  }
}
