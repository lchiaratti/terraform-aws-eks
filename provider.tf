terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.23.0"
    }
  }
  backend "s3" {
    bucket = "eks-tfstate-chiaratti"
    key    = "dev/eks-dev.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  # Configuration options
}