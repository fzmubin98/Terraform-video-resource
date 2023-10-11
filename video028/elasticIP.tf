resource "aws_eip" "fazle-aws_eip" {
  instance = aws_instance.fazle_ec2_pub.id
  #Depends-on Meta Argument
  depends_on = [ aws_internet_gateway.fazle_IGW ]

}