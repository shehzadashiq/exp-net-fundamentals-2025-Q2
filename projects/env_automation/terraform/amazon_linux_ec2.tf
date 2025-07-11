# Amazon Linux EC2 Instance and supporting resources


########################
# Security Group
########################

resource "aws_security_group" "amazon_linux_sg" {
  name        = "amazon_linux_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from my IP address only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AmazonLinuxSG"
  }
}

########################
# EC2 Instance
########################

resource "aws_instance" "amazon_linux" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.amazon_linux_sg.id]
  associate_public_ip_address = true
  key_name                    = var.linux_key_name

  tags = {
    Name = "AmazonLinuxInstance"
  }
}


