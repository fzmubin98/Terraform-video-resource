resource "aws_vpc" "fazle-vpc1" {
  cidr_block = "192.77.0.0/27"
  tags = {
    Name = "Fazle-vpc1"
  }
}
resource "aws_vpc" "fazle-vpc2" {
  cidr_block = "192.111.0.0/27"
  provider   = aws.uw2 #This is a meta argument
  tags = {
    Name = "Fazle-vpc2"
  }
}
#special arguments in Terraform that are used to control how resources are created, updated, or destroyed. 
#They are not specific to any particular resource type
#but rather provide a way to configure behavior across all resources in a Terraform configuration
#5 meta arguments: https://blog.knoldus.com/meta-arguments-in-terraform/