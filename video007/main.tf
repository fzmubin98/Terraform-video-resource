terraform {
  required_version = "~>1.5.4"
  required_providers {
    aws ={
      source = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
  #we can also use: Which should not be hardcoded 
  #but can be given through aws configure in aws cli
#   access_key = "XXXX"
#   secret_key = "XXXX"
#   They can be generated from the AWS profile's credentials
#   These two can be found by using: 
#   cat $HOME/.aws/credentials
}