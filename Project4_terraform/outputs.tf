# Output the public IP for EC2 (Used to connect after launcing, output in the terminal)
output "instance_public_ip" {
  description = "Public IP"
  value       = aws_instance.bioinformatics_instance.public_ip
}