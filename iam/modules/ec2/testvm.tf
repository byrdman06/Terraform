resource "aws_instance" "employee_vm" {
  ami                         = var.ami
  availability_zone           = var.AZ
  associate_public_ip_address = var.pub_ip_bool
  instance_type               = var.instance_type
  key_name                    = var.key_name
  tags = {
    "Name" = var.ec2_name
  }
}   