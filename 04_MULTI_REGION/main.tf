resource "aws_instance" "ireland" {
    ami = var.ami_id_ireland
    instance_type = var.instance_type_ireland
    provider = aws.ireland

    tags = {
        Name = "ireland_instance"
    }

}


resource "aws_instance" "london" {
    ami = var.ami_id_london
    instance_type = var.instance_type_london
    provider = aws.london   

    tags = {
        Name = "london_instance"
    }
  
}