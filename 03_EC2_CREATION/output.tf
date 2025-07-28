output "public_ip" {
  value = aws_instance.example_instance.public_ip
}

output "private_ip" {
  value = aws_instance.example_instance.private_ip
}

output "public_dns" {
    value = aws_instance.example_instance.public_dns
}

output "instance_id" {
  value = aws_instance.example_instance.id
}