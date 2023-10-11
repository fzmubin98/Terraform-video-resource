//VPC 
resource "aws_vpc" "fazle-vpc" {
  cidr_block = "192.168.56.0/28"
}

//Subnet
resource "aws_subnet" "fazle-subnet" {
  vpc_id     = aws_vpc.fazle-vpc.id
  cidr_block = "192.168.56.0/28"
}

//Create an IGW
resource "aws_internet_gateway" "fazle_IGW" {
  vpc_id = aws_vpc.fazle-vpc.id //dep
}
//Create RT for pub Subnet
resource "aws_route_table" "Public_RT" {
  vpc_id = aws_vpc.fazle-vpc.id //dep
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fazle_IGW.id
  }
}
//Associate RT with PS
resource "aws_route_table_association" "PRT_Associate" {
  subnet_id      = aws_subnet.fazle-subnet.id
  route_table_id = aws_route_table.Public_RT.id
}