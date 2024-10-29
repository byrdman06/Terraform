resource "aws_instance" "tf_project1" {
  ami               = "ami-06b21ccaeff8cd686"
  availability_zone = "us-east-1a"
  instance_type     = "t2.medium"
  key_name          = "cwm_key"
}

resource "aws_iam_user" "user1" {
  name = "stephen"
}

resource "aws_iam_user" "user2" {
  name = "admins"
}

resource "aws_iam_group" "group1" {
  name = "tfgroup"
}

resource "aws_iam_group_membership" "groupadd1" {
  name = "tf-user_group_add"
  users = [ 
    aws_iam_user.user1.name,
    aws_iam_user.user2.name
   ]
  group = aws_iam_group.group1.name
}