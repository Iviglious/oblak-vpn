
resource "aws_security_group" "oblak-vpn-sg" {
  name        = "oblak-vpn-sg"
  description = "Allow SSH and VPN traffic."
  vpc_id      = aws_vpc.oblak-vpn-vpc.id

  ingress {
    # SSH 22 IN traffic
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"] # add a CIDR block here
    description = "SSH 22 for admin"
  }

  ingress {
    # SSH 943 IN traffic
    from_port   = 943
    to_port     = 943
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"] # add a CIDR block here
    description = "SSH 943 for admin"
  }

  ingress {
    # HTTPS IN traffic
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"] # add a CIDR block here
    description = "HTTPS 443 to web interface."
  }

  ingress {
    # HTTPS IN traffic
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"] # add a CIDR block here
    description = "HTTPS 1194 for OpenVPN."
  }

  egress {
    # Allow all outbound traffic
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

