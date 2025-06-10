variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.200.200.0/24"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.200.200.0/25"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.200.200.128/25"
}

variable "aws_region" {
  description = "AWS Region to use for the VPC"
  type        = string
  default     = "eu-west-2"
}

variable "availability_zone" {
  description = "Availability Zone to use for the subnets"
  type        = string
  default     = "eu-west-2a"
}


