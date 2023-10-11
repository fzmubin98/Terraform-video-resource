resource "aws_vpc" "fazle-vpc" {
  cidr_block = "192.35.0.0/27"

  tags = {
    Name = "fazle-vpc"
  }
}