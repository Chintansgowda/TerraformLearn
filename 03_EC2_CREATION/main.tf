resource "aws_key_pair" "my_key" {
  key_name   = "csg_terra"
  public_key = file("csg_terra.pub")
  
}

resource "aws_default_vpc" "my_vpc" { }

resource "aws_security_group" "example_sg" {
    name = "example_sg"
    description = "Example security group"
    vpc_id = aws_default_vpc.my_vpc.id  #interpolation : interpolation in way where you you can inherit or extract value from one resource to other resource or block

    ingress {
        from_port = 22
        to_port = 22    
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {
        from_port = 80
        to_port = 80    
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0    
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

    resource "aws_instance" "example_instance" {

        tags = {
            Name = var.instance_name
        }   

        ami = var.ami_id # Example AMI ID, replace with a valid one
        instance_type = var.instance_type  
        key_name = aws_key_pair.my_key.key_name
        vpc_security_group_ids = [aws_security_group.example_sg.id]   
        user_data = file("nginx_ubuntu_installation.sh") # If you want to use this also as varaiables not haardcode values use varaible and locals in variable .tf

        
        root_block_device {
            volume_size = var.volume_size
            volume_type = var.volume_type
        }    
}
