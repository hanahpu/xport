#VPC

resource "aws_vpc" "xport_vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "xport_vpc"
  }
}

#Public subnet

resource "aws_subnet" "xport_public_subnet" {
  vpc_id = "${aws_vpc.xport_vpc.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-2a"


}

#Private Subnet

resource "aws_subnet" "xport_private_subnet" {
  vpc_id = "${aws_vpc.xport_vpc.id}"
  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "us-east-2b"


}

#Internet Gateway

resource "aws_internet_gateway" "xport_internet_gateway" {
  vpc_id = "${aws_vpc.xport_vpc.id}"


}

#Route Table

resource "aws_route_table" "xport_public_rt" {
  vpc_id = "${aws_vpc.xport_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.xport_internet_gateway.id}"
  }

}

#Assign RT to Public Subnet

resource "aws_route_table_association" "xport_public_rt" {
  subnet_id = "${aws_subnet.xport_public_subnet.id}"
  route_table_id = "${aws_route_table.xport_public_rt.id}"
}

# Security Groups Public Subnet

resource "aws_security_group" "xport_sg_public_subnet" {
  name = "xport_sg_public_subnet"
  description = "Web Security Group"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  vpc_id="${aws_vpc.xport_vpc.id}"

}

#Security Groups Private Subnet

resource "aws_security_group" "xport_sg_private_subnet"{
  name = "xport_sg_private_subnet"
  description = "DB Security Group"

  ingress {
    from_port = 9043
    to_port = 9043
    protocol = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }


  vpc_id = "${aws_vpc.xport_vpc.id}"

}

#Security Group For App Server

resource "aws_security_group" "xport_sg_public_app_subnet"{
  name = "xport_sg_public_app_subnet"
  description = "APP Security Group"

ingress {
    from_port = 9043
    to_port = 9043
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }


  vpc_id = "${aws_vpc.xport_vpc.id}"

}

