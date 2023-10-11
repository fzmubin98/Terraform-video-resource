variable "vpc_cidr_block" {
  description = "This is the cidr block for my vpc"
  type        = string
  #default     = "192.123.0.0/16"
  sensitive = true
}

variable "subnet_cidr_block" {
  description = "This the cidr block for my subnet"
  type        = string
  default     = "192.123.0.0/24"
  validation {
    condition = length(var.subnet_cidr_block)>7 && substr(var.subnet_cidr_block,0,2) == "19"
    error_message = "The given subnet id has errors"
  }
}

# variable "subnet_az" {
#   description = "This is the availability zone for my subnet"
#   type        = list(string)
#   default     = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d"]
# }

variable "subnet_az" {
  description = "This is the availability zone for my subnet"
  type        = map(string)
  default = {
    aZone = "us-east-1a",
    bZone = "us-east-1b",
    cZone = "us-east-1c",
    dZone = "us-east-1d"
  }
}


#terraform plan -var="subnet_az=us-east-1b"
#terraform apply -var="subnet_az=us-east-1b"