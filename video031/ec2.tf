//EC2 Instance Creation
resource "aws_instance" "fazle-EC2" {
  ami           = "ami-08a52ddb321b32a8c"
  subnet_id     = aws_subnet.fazle-subnet.id
  instance_type = "t2.micro"
  count         = 5
  tags = {
    Name = "Fazle-EC2-${count.index}"
  }
}

