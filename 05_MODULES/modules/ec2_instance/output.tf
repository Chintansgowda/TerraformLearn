output "public_ip" {
  value = aws_instance.my-instance.public_ip
  description = "The public IP address of the EC2 instance"
  
}

output "private_ip" {
    value = aws_instance.my-instance.private_ip
    description = "The private IP address of the EC2 instance"
}

output "public_dns" {
    value = aws_instance.my-instance.public_dns
    description = "The public DNS name of the EC2 instance"
}   

output "instance_id" {
    value = aws_instance.my-instance.id
    description = "The ID of the EC2 instance"
}   