resource "aws_key_pair" "xport_key_pair" {
  key_name   = "xport_key_pair"
  public_key = "${var.ssh_key}"
}
