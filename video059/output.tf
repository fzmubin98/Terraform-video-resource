output "ec2_public_ip" {
  description = "This is the value for the public IP of the EC2 instance"
  value = aws_instance.fazle-EC2.public_ip
  sensitive = true
}

output "ec2_private_ip" {
  description = "This is the value for the private IP of the EC2 instance"
  value = aws_instance.fazle-EC2.private_ip
}

output "ec2_SG" {
  description = "This is the value for the security group of the EC2 instance"
  value = aws_instance.fazle-EC2.vpc_security_group_ids
}