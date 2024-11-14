output "launch_template_id" {
  value = aws_launch_template.launch_template1.id
}

output "launch_template_version" {
  value = aws_launch_template.launch_template1.latest_version
}