
#count is a meta argument that allows you to create multiple instances of a resource.
#In this example, we are creating 2 instances of the aws_instance resource.

resource "aws_instance" "my-instance" {

    count = 2  #meta argument
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    
    root_block_device {
        volume_size = var.env == "prod" ? 20 : var.volume_size # conditinal-expression
        volume_type = var.volume_type
    }
    tags = {
        Name = var.instance_name
    }
  
}
