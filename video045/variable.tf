variable "vpc_cidr_block" {
  description = "This is the cidr block for my vpc"
  type        = string
  default     = "192.123.0.0/16"
}

variable "subnet_cidr_block" {
  description = "This the cidr block for my subnet"
  type        = string
  default     = "192.123.1.0/24"
}

variable "subnet_az" {
  description = "This is the availability zone for my subnet"
  type        = string
  #default     = "us-east-1a"
}