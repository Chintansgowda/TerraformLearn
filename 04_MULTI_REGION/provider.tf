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
  region = "eu-west-2"
  alias = "london"

}

provider "aws" {
  # Configuration options
  region = "eu-west-1"
  alias = "ireland"
}