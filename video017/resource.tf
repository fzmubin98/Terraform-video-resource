resource "aws_vpc" "fazle-vpc1" {
  cidr_block = "192.78.0.0/27"
  tags = {
    Name = "Fazle-Vpc1"
  }
}
