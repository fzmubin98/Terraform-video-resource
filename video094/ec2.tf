data "aws_ami" "latest_amazon_linux2" {
  most_recent = true
  owners      = ["137112412989"]
  filter {
    name = "name"
    #values = ["amzn2-ami-hvm-*-x86_64-ebs"]
    values = ["al2023-ami-2023.1.20230809.0-kernel-6.1-x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "Fazle-single-instance"

  ami                    = data.aws_ami.latest_amazon_linux2.id
  instance_type          = "t2.micro"
  key_name               = "fazle1"
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.sg1.id]
  subnet_id              = aws_subnet.fazle-subnet.id

  tags = {
    Name        = "Fazle-EC2"
    Terraform   = "true"
    Environment = "dev"
  }
}