
resource "aws_vpc" "oblak-vpn-vpc" {
  cidr_block = "172.31.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "oblak-vpn-vpc"
  }
}


resource "aws_subnet" "oblak-vpn-subnet" {
  vpc_id            = aws_vpc.oblak-vpn-vpc.id
  cidr_block        = "172.31.32.0/20"
  availability_zone = var.zone
  map_public_ip_on_launch = true

  tags = {
    Name = "oblak-vpn-subnet"
  }
}


resource "aws_internet_gateway" "oblak-vpn-gw" {
  vpc_id = aws_vpc.oblak-vpn-vpc.id

  tags = {
    Name = "oblak-vpn-gw"
  }
}


resource "aws_route" "oblak-vpn-route" {
  route_table_id         = aws_vpc.oblak-vpn-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.oblak-vpn-gw.id
}


resource "aws_network_interface" "oblak-vpn-ni" {
  subnet_id   = aws_subnet.oblak-vpn-subnet.id
  private_ips = ["172.31.32.101"]
  security_groups = [aws_security_group.oblak-vpn-sg.id]

  tags = {
    Name = "oblak-vpn-ni"
  }
}

