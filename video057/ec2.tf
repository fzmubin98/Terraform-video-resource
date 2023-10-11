//EC2 Instance Creation
resource "aws_instance" "fazle-EC2" {
  ami                         = "ami-08a52ddb321b32a8c"
  subnet_id                   = aws_subnet.fazle-subnet.id
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.fazle_SG_EC2.id]
  user_data                   = file("user_data.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "Fazle-EC2"
  }
}

