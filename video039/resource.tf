resource "aws_vpc" "fazle-vpc" {
  cidr_block = "192.155.0.0/16"
  tags = {
    Name = "fazle-vpc"
  }
  lifecycle {
    ignore_changes = [ tags ]
  }
}