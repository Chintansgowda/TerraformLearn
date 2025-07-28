variable "region" {
    description = "The AWS region where resources will be created"
    type        = string
    default     = "eu-west-2"
  
}

variable "cidr" {
    default = "10.0.0.0/16"
  
}

variable "PubS1_cidr" {
    default = "10.0.1.0/24"
  
}

variable "PubS2_cidr" {
    default = "10.0.2.0/24"
  
}

variable "PubS1_az" {
    default = "eu-west-2a"
}

variable "PubS2_az" {
    default = "eu-west-2b"
  
}

variable "PvtS1_cidr" {
      default = "10.0.100.0/24"

}
variable "PvtS1_az" {
    default = "eu-west-2a"
}

variable "ami_id" {
    description = "AMI ID for the instance"
    type        = string
    
  
}

variable "instance_type" {
    description = "Instance type for the EC2 instance"
    type        = string
    default     = "t2.micro"
}

variable "volume_size" {
    description = "Size of the EBS volume in GB"
    type        = number
    default     = 8
}

variable "key_name" {
    description = "Name of the SSH key pair to use for the instance"
    type        = string
    default     = "aws_login"
  
}