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
	default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBbZDrvUhOr/4HCqGW2GNStQcqiOrM1qSE1NgD2/TZauB5cVxRIFJ4tJ+1EQFTskg5isfv+u5vIAuZqtXVWAu+vESe6snwPEjTtYc3uJ3qMvy1FwKs0az2YZqeJnKRegrLYvYXdAOzi01PufXq73c2ShP+lPzukL4MuTEb4/5VafWFhPC4MrSWTLSJzj36yNozB7Cayr4/Odwi2ZqRDLZnsN+bsQX+1K594krQlMyC6LxiU3pBWDu5dNNG3rF7Uv1GuphPnzG2Sz5YN2K+4YyvS9e+VUGsW/dWb43+eG3ispFdAY3OpsrxNW6G2HLnYMn4Nwsqlg7pky9007Qy9IPSd rsa-key-20190619"
}

variable "user" {
	description = "User for RDS"
	default	= "user"
}

variable "pass" {
	description = "Password for RDS"
	default = "password"
}
