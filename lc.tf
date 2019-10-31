resource "aws_launch_configuration" "xport_launch_configuration" {
  name	        = "xport_launch_configuration"
  image_id      = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.xport_key_pair.key_name}"
  security_groups  = [ "${aws_security_group.xport_sg_public_subnet.id}" ]
  associate_public_ip_address = true
  
  user_data       = "${file("user-data.txt")}"

  lifecycle {
    create_before_destroy = true
  }
}
