output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
}
