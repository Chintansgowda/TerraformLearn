# output for for_each is bit diff from normal o/p

output "public_ip" {

    value = [ for instance in aws_instance.my-instance : instance.public_ip]
  
}

output "private_ip" {

    value = [ for instance in aws_instance.my-instance : instance.private_ip]
  
}

