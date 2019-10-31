# Create a new load balancer


resource "aws_elb" "xport-load-balancer" {
  name               = "xport-load-balancer"
  subnets	= [ "${aws_subnet.xport_public_subnet.id}" ]
 
  security_groups  = [ "${aws_security_group.xport_sg_public_subnet.id}" ]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 8080
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    timeout             = 10
    target              = "HTTP:8080/"
    interval            = 30
  }


  tags = {
    Name = "xport_web_server_lb"
  }
}
