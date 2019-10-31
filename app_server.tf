resource "aws_instance" "xport_app_server" {
        ami     = "${var.ami}"
        instance_type   = "${var.instance_type}"
        security_groups  = ["${aws_security_group.xport_sg_public_app_subnet.id}"]
        subnet_id       = "${aws_subnet.xport_public_subnet.id}"
	key_name      = "${aws_key_pair.xport_key_pair.key_name}"
        tags    = {
                Name = "App Server"
        }
}

