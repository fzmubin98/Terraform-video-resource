terraform {
  required_version = "~>1.5.4"
  required_providers {
    aws = {
      version = "~>3.11.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "fazle-test-bucket"
    key    = "tfstate/terraform.tfstate"
    region = "us-east-1"
    //Lock file using DynamoDB
    dynamodb_table = "fazle-stateLock-test"
  }
}