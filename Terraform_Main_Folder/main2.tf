resource "aws_instance" "tf_project2" {
  ami                         = "ami-06b21ccaeff8cd686"
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = "cwm_key"

  tags = {
    "Name" = "stephen"
  }
}