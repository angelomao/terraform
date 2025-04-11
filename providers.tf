terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "remote" {
    organization = "Angelo-TF-Cloud"

    workspaces {
      name = "terraform"
    }
  }
}

provider "aws" {
  region = "ap-east-1"
}