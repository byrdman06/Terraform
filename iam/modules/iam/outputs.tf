output "employee_user_name" {
  description = "Name of employee"
  value = aws_iam_user.new_employee_user_name.name
}