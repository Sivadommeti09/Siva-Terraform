#Creating vpc
resource "aws_vpc" "Siva_VPC" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "Siva_VPC"
  }
}
 