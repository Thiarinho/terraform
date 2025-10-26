variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block of VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR for subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "AZ for subnet"
  default     = "us-west-2a"
}

variable "ami_id" {
  description = "AMI ID for EC2"
}

variable "instance_type" {
  description = "EC2 type"
  default     = "t2.micro"
}
