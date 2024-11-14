resource "aws_instance" "atlasec2tf" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  availability_zone = "us-east-2c"
  key_name      = "cwm_key"

  root_block_device {
    volume_size = 4
    volume_type = "gp2"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update
              yum install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "<h1>Hello from Terraform!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "atlasec2tf"
  }
}

resource "aws_security_group" "custom_sg" {
  name        = "custom_security_group"
  description = "Allow SSH and HTTPS access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = "vpc-0a5373b912e8cdc7b"
  cidr_block              = "172.31.0.0/16"
  availability_zone      = "us-east-2c"
  map_public_ip_on_launch = true
}