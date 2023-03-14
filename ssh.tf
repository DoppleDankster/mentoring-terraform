# Create New SSH Key
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "awspk" {
  key_name   = "sshkey"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # local-exec == my pc
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./sshkey.pem"
  }
}
