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
  region = var.aws_region  # Default region, can be overridden by variable
#   access_key = var.aws_acess_key  
#   secret_key = var.aws_secret_key
}