resource "aws_launch_template" "launch_template1" {
  description = "AWS launch template"
  image_id = var.ami
  instance_type = var.i_type
  key_name = var.key_name
  vpc_security_group_ids = [ var.sg_id ]
  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    yum update
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello from Terraform!</h1>" > /var/www/html/index.html
    EOF
  )
}