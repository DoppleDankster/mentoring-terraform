variable "instance_name" {
  type        = string
  description = "The value for the `Name` tag of the ec2 instance"
}

variable "instance_type" {
  type        = string
  description = "the type of instance to deploy ex: t2.micro"
}
