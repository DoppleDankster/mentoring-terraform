# Create IAM Role to access S3 from an EC2

resource "aws_iam_policy" "s3policy" {
  name        = "S3ReadOnlyPolicy"
  path        = "/"
  description = "List bucket and bucket content"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:ListAllMyBuckets",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "ec2_s3_role" {
  name = "ec2-read-s3-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "attach_s3_policy_to_ec2_role" {
  name       = "ro_s3_policy_attached_to_ec2_role"
  roles      = ["${aws_iam_role.ec2_s3_role.name}"]
  policy_arn = aws_iam_policy.s3policy.arn
}


resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_s3_role.name
}
