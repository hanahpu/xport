resource "aws_autoscaling_group" "xport_auto_scaling_group" {
  name_prefix		    = "xport_web_server"
  max_size                  = 3
  min_size                  = 0
  desired_capacity          = 2
  launch_configuration      = "${aws_launch_configuration.xport_launch_configuration.name}"
  vpc_zone_identifier       = ["${aws_subnet.xport_public_subnet.id}"]
  
  load_balancers	    = [ "${aws_elb.xport-load-balancer.name}" ]

  tag {
    key                 = "Name"
    value               = "xport_auto_scaling_group-instance"
    propagate_at_launch = true
  }
}
