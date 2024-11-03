data "aws_vpc" "tfvpc" {
  filter {
    name = "tag:Name"
    values = [ "default-vpc" ]
  }
}

resource "aws_security_group" "vpc_sg" {
  name = "ssh-https-nfs"
  description = "security group for vpc"
  vpc_id = data.aws_vpc.tfvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.0.0/16"]
  }
}