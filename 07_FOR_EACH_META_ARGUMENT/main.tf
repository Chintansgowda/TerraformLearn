resource "aws_instance" "my-instance" {

  for_each = var.mul_ec2
  depends_on = [ var.security_group_id,var.vpc_id ] #depends_on is also a meta argument that Explicitly declare resource dependencies

  ami                    = var.ami_id
  instance_type          = each.value
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = each.key
  }
  
}