data "aws_vpc" "existing_vpc" {
  id = "vpc-0a5373b912e8cdc7b"
}

resource "aws_security_group" "allow_ssh_https_nfs" {
  name        = "allow-ssh-https-nfs"
  description = "Security group to allow SSH, HTTPS, and NFS"
  vpc_id     = data.aws_vpc.existing_vpc.id

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