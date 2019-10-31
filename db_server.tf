resource "aws_db_instance" "xport_db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "xport_db"
  username             = "${var.user}"
  password             = "${var.pass}"
  
  vpc_security_group_ids = ["${aws_security_group.xport_sg_private_subnet.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.xport_db_subnet_grp.name}"  

}

resource "aws_db_subnet_group" "xport_db_subnet_grp" {
  name       = "xport_db_subnet_grp"
  subnet_ids = ["${aws_subnet.xport_private_subnet.id}", "${aws_subnet.xport_public_subnet.id}"]

  tags = {
    Name = "My DB subnet group"
  }
}
