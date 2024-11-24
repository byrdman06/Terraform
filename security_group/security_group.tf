data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_security_group" "tf_sg" {
  name        = "mysql-sg"
  description = "allow mysql traffic"
  vpc_id      = data.aws_vpc.default_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "ingress1" {
  security_group_id = aws_security_group.tf_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 3306
  to_port           = 3306
}

resource "aws_vpc_security_group_egress_rule" "egress1" {
  security_group_id = aws_security_group.tf_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}