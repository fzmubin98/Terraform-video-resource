resource "aws_instance" "fazle-INSTANCE" {
  ami               = "ami-08a52ddb321b32a8c"
  instance_type     = "t2.micro"
  subnet_id         = aws_subnet.fazle-subnet.id
  availability_zone = "us-east-1a"
  #availability_zone = "us-east-1b"
 #lifecycle {
    #create_before_destroy = true
    #prevent_destroy = true
  #}
}