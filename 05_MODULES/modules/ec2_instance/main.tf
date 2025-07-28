
resource "aws_instance" "my-instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [var.security_group_id]
    subnet_id = var.subnet_id
    
    root_block_device {
        volume_size = var.volume_size
        volume_type = var.volume_type
    }
    tags = {
        Name = var.instance_name
    }
  
}