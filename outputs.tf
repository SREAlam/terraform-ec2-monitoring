output "instance_ip" {
  description = "35.171.26.126"
  value       = aws_instance.example.public_ip
}

output "instance_id" {
  description = "i-0ef4145627c832aea"
  value       = aws_instance.example.id
}