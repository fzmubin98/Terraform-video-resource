terraform {
  required_version = "~>1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

provider "aws" {
  region  = "us-east-2"
  profile = "default"
  alias   = "uw2"
}