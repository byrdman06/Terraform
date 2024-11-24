resource "aws_iam_user" "new_employee_user_name" {
  name = var.employee_user_name
}

resource "aws_iam_group" "employee_role" {
  name = var.employee_role
}

resource "aws_iam_group_membership" "employee_role_add" {
  name = "employee_role_add"
  users = [
    aws_iam_user.new_employee_user_name.name
  ]
  group = aws_iam_group.employee_role.name
}