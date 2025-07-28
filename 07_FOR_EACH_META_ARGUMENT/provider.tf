terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.5.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-west-2"  # Default region, can be overridden by variable
#   access_key = var.aws_acess_key  
#   secret_key = var.aws_secret_key
}