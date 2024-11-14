data "aws_subnet" "subnet1" {
  id = "subnet-0e5efbad2c6d590ea"
}

data "aws_subnet" "subnet2" {
  id = "subnet-09688af519f78a37c"
}

resource "aws_autoscaling_group" "tf_asg" {
  name = var.asg_name
  max_size = var.max
  min_size = var.min
  desired_capacity = var.desired 
  vpc_zone_identifier = [ data.aws_subnet.subnet1.id, data.aws_subnet.subnet2.id ]
  launch_template {
    id = var.launch_template_id
    version = var.launch_template_version
  }
}