//VPC 
resource "aws_vpc" "fazle-vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "Fazle-VPC"
  }
}

//Subnet
resource "aws_subnet" "fazle-subnet" {
  vpc_id     = aws_vpc.fazle-vpc.id
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = "Fazle-SUBNET"
  }
}

