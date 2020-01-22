
resource "aws_instance" "oblak-vpn-machine" {
  ami                    = var.ami-id
  instance_type          = var.instance-type
  key_name               = var.key_pair_name
  user_data              = data.template_file.user_data.rendered
  
  tags                   = {
    Name  = "oblak-vpn-machine-main"
    Owner = var.profile
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
    
  }

  network_interface {
    network_interface_id = aws_network_interface.oblak-vpn-ni.id
    device_index         = 0
  }
}

