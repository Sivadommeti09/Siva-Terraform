# creating Internet Gateway
resource "aws_internet_gateway" "Sivagateway" {
  vpc_id = "${aws_vpc.Siva_VPC.id}"
   tags ={
     Name ="IGW"
}
}