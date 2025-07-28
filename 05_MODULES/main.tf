module "ec2_instance" {
  source = "./modules/ec2_instance"

  instance_type     = var.instance_type
  ami_id            = var.ami_id
  key_name          = var.key_name
  volume_size       = var.volume_size
  volume_type       = var.volume_type
  instance_name     = var.instance_name
  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id
  vpc_id            = var.vpc_id
  
}
