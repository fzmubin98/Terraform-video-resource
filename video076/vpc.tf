resource "aws_vpc" "fazle-vpc" {
  cidr_block = "192.169.0.0/16"
  tags = {
    Name = "Fazle-vpc"
  }
}

resource "aws_vpc" "fazle-vpc-new" {
  cidr_block = "192.166.0.0/16"
  tags = {
    Name = "Fazle-vpc-#2"
  }
}