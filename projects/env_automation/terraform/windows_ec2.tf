# Windows Server 2025 EC2 Instance and supporting resources

########################
# Security Group
########################

resource "aws_security_group" "windows2025_sg" {
  name        = "windows2025_sg"
  description = "Allow RDP inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "RDP from anywhere (adjust as needed)"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Windows2025SG"
  }
}

########################
# EC2 Instance
########################

resource "aws_instance" "windows2025" {
  ami                         = data.aws_ami.windows2025.id
  instance_type               = "t3.medium"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.windows2025_sg.id]
  associate_public_ip_address = true

  # Include key pair only when provided
  key_name = var.windows_key_name != "" ? var.windows_key_name : null

  tags = {
    Name = "Windows2025Instance"
  }
}

########################
# Outputs
########################

output "windows2025_instance_id" {
  description = "ID of the Windows Server 2025 instance"
  value       = aws_instance.windows2025.id
}

output "windows2025_public_ip" {
  description = "Public IP address of the Windows Server 2025 instance"
  value       = aws_instance.windows2025.public_ip
}
