variable "ami_id_ireland" {
    description = "value for AMI ID"
    type        = string
    default     = "ami-01f23391a59163da9" # Example AMI
  
}

variable "ami_id_london" {
    description = "value for AMI ID"
    type        = string
    default     = "ami-044415bb13eee2391" # Example AMI
  
}

variable "instance_type_ireland" {
    description = "Type of the AWS instance for Mumbai region"
    type        = string
    default     = "t2.micro"
  
}

variable "instance_type_london" {
    description = "Type of the AWS instance for London region"
    type        = string
    default     = "t2.micro"
  
}