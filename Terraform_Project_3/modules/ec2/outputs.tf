output "pub_ip" {
  description = "Public IP of instance"
  value       = aws_instance.employee_vm.public_ip
}

output "private_ip" {
  description = "Private IP of instance"
  value       = aws_instance.employee_vm.private_ip
}

output "instance_id" {
  description = "ID of instance"
  value       = aws_instance.employee_vm.id
}