# creating 1st EC2 instance in Public Subnet
resource "aws_instance" "Sivainstance" {
  ami = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  count = 1
  key_name = "21"
  vpc_security_group_ids = ["${aws_security_group.SivaSG.id}"]
  subnet_id = "${aws_subnet.public-subnet-1.id}"
  associate_public_ip_address = true
  user_data = "${file("data.sh")}"
  tags = {
   Name = "My Public Instance"
}
}
# creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "Sivainstance1" {
  ami = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  count = 1
  key_name = "21"
  vpc_security_group_ids = ["${aws_security_group.SivaSG.id}"]
  subnet_id = "${aws_subnet.public-subnet-2.id}"
  associate_public_ip_address = true
  user_data = "${file("data.sh")}"
  tags = {
    Name = "My Public Instance 1"
}
}
