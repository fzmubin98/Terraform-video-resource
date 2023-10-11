terraform {
  required_version = "~>1.5.1"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.12.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }

}
