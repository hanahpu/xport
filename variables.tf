# Variables File

variable "vpc_cidr" {
	description = "CIDR for the xport_vpc"
	default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
	description = "CIDR for the public subnet"
	default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
	description = "CIDR for the private subnet"
	default = "10.0.2.0/24"
}

variable "ami" {
	description = "AMI ubuntu"
	default = "ami-0d5d9d301c853a04a"
}

variable "instance_type" {
	description = "Instance type = t2.micro"
	default = "t2.micro"
}

variable "ssh_key" {
	description = "Public Key"
	default = "ssh-rsa Lorem Ipsum"
}

variable "user" {
	description = "User for RDS"
	default	= "user"
}

variable "pass" {
	description = "Password for RDS"
	default = "password"
}
