variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type = string
  default = "eu-west-2"  # Default to London region
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  type = string
  default = "t2.micro"  # Default instance type 
  
}   

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type = string
  default = "ami-044415bb13eee2391"  # Example AMI ID for Ubuntu in London region
}

variable "volume_size" {
  description = "The size of the EBS volume in GB"
  type = number
  default = 8  # Default volume size
}

variable "volume_type" {
  description = "The type of EBS volume"
  type = string
  default = "gp2"  # Default to General Purpose SSD
  
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type = string
  default = "london-ubuntu-instance"  # Default instance name
  
}

variable "security_group_id" {
  description = "value of the security group to be used"
  type = string   
  
}

variable "subnet_id" {
    description = "value of the subnet to be used"
    type = string
    
}
variable "vpc_id" {
    description = "value of the VPC to be used"
    type = string
  
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type = string
  
}

variable "env" {     #A conditional expression in Terraform is like an if-else statement that lets you assign a value based on a condition
   default = "prod"
   type = string  
}