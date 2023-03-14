# Security Group to allow SSH
resource "aws_security_group" "allow-ssh" {
  name = "allow-all-sg"

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance

resource "aws_instance" "ec2_with_s3_read" {
  ami                  = "ami-0f7cd40eac2214b37"
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  security_groups      = [aws_security_group.allow-ssh.name]
  key_name             = aws_key_pair.awspk.key_name
  user_data            = file("install_awscli.sh")

  tags = {
    Name = var.instance_name
  }
}
