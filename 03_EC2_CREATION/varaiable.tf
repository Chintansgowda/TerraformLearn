variable "aws_acess_key" {
  description = "AWS Access Key"
  type        = string
  sensitive = true
  
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive = true
  
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2" # Example region, replace with your desired region  
  
}

variable "instance_type" {
  description = "Type of the AWS instance"
  type        = string
  default     = "t2.micro"
  
}

variable "ami_id" {
  description = "AMI ID for the AWS instance"
  type        = string
  default     = "ami-044415bb13eee2391" # Example AMI ID, replace with a valid one
  
}

variable "volume_size" {
     default = 8
     type = number
     description = "Size of the root block device in GB"
}

variable "volume_type" {
     default = "gp2"
  
}

variable "instance_name" {
  description = "Name of the AWS instance"
  type        = string
  default     = "ubuntu_csg"
  
}

# variable "nginx_ubuntu" {

#   description = "value for nginx ubuntu installation script"
#   type = "string  "
#   default = "nginx_ubuntu_installation.sh"  
# }

# locals {
#   nginx_ubuntu_local = file(var.nginx_ubuntu)
# }

# variable "nginx_amzlinux" {
#   description = "value for nginx amzlinux installation script"
#   type = "string"
#   default = "nginx_amzlinux_installation.sh"  
  
# }

# locals {
#   nginx_amzlinux_local = file(var.nginx_amzlinux)
# }
