output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private.id
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

output "amazon_linux_instance_id" {
  description = "ID of the Amazon Linux instance"
  value       = aws_instance.amazon_linux.id
}

output "amazon_linux_public_ip" {
  description = "Public IP address of the Amazon Linux instance"
  value       = aws_instance.amazon_linux.public_ip
}

output "ubuntu_linux_instance_id" {
  description = "ID of the Ubuntu Linux instance"
  value       = aws_instance.ubuntu_linux.id
}

output "ubuntu_linux_public_ip" {
  description = "Public IP address of the Ubuntu Linux instance"
  value       = aws_instance.ubuntu_linux.public_ip
}


