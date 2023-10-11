resource "aws_vpc" "fazle-vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "fazle-subnet" {
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.subnet_az["cZone"]
  vpc_id            = aws_vpc.fazle-vpc.id
}