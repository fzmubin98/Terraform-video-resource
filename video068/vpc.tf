resource "aws_vpc" "fazle-vpc" {
  cidr_block = "192.169.0.0/16"
  tags = {
    Name = "Fazle-vpc"
  }
}