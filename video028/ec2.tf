resource "aws_instance" "fazle_ec2_pub" {
  ami           = "ami-08a52ddb321b32a8c"//dep
  instance_type = "t2.micro"
  subnet_id              = aws_subnet.Public_Sub.id
  vpc_security_group_ids = [aws_security_group.fazle_SG_EC2.id]
  associate_public_ip_address = "true"

  user_data = file("data.sh")

  tags = {
    Name  = "fazle_ec2_pub"
    Owner = "fazle"
  }
}