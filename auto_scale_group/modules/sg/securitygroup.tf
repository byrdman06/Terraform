data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_security_group" "tf_sg" {
  name        = "http+https"
  description = "allow http/s traffic"
  vpc_id      = data.aws_vpc.default_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "ingress1" {
  security_group_id = aws_security_group.tf_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = var.http_port
  to_port           = var.http_port
}

resource "aws_vpc_security_group_ingress_rule" "ingress2" {
  security_group_id = aws_security_group.tf_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = var.https_port
  to_port           = var.https_port
}

resource "aws_vpc_security_group_egress_rule" "egress1" {
  security_group_id = aws_security_group.tf_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}