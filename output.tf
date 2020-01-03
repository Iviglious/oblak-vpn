
output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.oblak-vpn-machine.public_ip
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances, if applicable"
  value       = aws_instance.oblak-vpn-machine.public_dns
}


