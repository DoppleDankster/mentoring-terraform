output "instance_ips" {
  value = aws_instance.ec2_with_s3_read.public_ip
}
