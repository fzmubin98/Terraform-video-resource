//Create my VPC
resource "aws_vpc" "fazle_vpc" {
  cidr_block = "192.168.0.0/16"//dep
  tags = {
    Name  = "fazle_vpc"
    Owner = "fazle"
  }
}
//Create a Public Subnet
resource "aws_subnet" "Public_Sub" {
  vpc_id     = aws_vpc.fazle_vpc.id//dep
  cidr_block = "192.168.0.0/24"//dep
  tags = {
    Name  = "fazle_subnet"
    Owner = "fazle"
  }
}
//Create an IGW
resource "aws_internet_gateway" "fazle_IGW" {
  vpc_id = aws_vpc.fazle_vpc.id//dep
  tags = {
    Name  = "fazle_IGW"
    Owner = "fazle"
  }  
}
//Create RT for pub Subnet
resource "aws_route_table" "Public_RT" {
  vpc_id = aws_vpc.fazle_vpc.id//dep
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fazle_IGW.id
  }
  tags = {
    Name  = "fazle_RT"
    Owner = "fazle"
  }
}
//Associate RT with PS
resource "aws_route_table_association" "PRT_Associate" {
  subnet_id      = aws_subnet.Public_Sub.id
  route_table_id = aws_route_table.Public_RT.id
}