terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use a stable version
    }
  }
}

provider "aws" {
  region = "us-east-1" # Specify the region here
}