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

resource "aws_instance" "fazle-EC2-Public" {
  ami                         = data.aws_ami.latest_amazon_linux2.id
  subnet_id                   = aws_subnet.fazle-subnet.id
  vpc_security_group_ids      = [aws_security_group.sg1.id]
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "fazle1"

  user_data = file("install.sh")

  tags = {
    Name  = "Fazle-ec2-Public"
    Owner = "Fazle"
  }

}

resource "time_sleep" "sleep-90-sec" {
  depends_on      = [aws_instance.fazle-EC2-Public]
  create_duration = "90s"
}

resource "null_resource" "trigger-condition" {
  depends_on = [time_sleep.sleep-90-sec]
  triggers = {
    always-update = timestamp()
  }

  connection {
    type        = "ssh"
    host        = aws_instance.fazle-EC2-Public.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("fazle1.pem")
  }

  provisioner "file" {
    source      = "file/comment.html"
    destination = "/tmp/comment.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp /tmp/comment.html /var/www/html"
    ]
  }
}
