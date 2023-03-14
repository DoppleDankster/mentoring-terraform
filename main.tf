terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }

  }
  backend "s3" {
    bucket = "terraform-state-doppledankster"
    key    = "my-state"
    region = "eu-west-3"
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-3"
}
