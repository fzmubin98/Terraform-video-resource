terraform {
  required_version = "~>1.5.4"
  required_providers {
    aws = {
      version = "~>5.13.0"
      source  = "hashicorp/aws"
    }

    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}