output "ip_instance" {
  value = aws_instance.ec2_module_instance.public_ip
}
