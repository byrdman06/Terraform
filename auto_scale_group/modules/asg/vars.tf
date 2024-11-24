variable "asg_name" {
  description = "ASG name"
  type = string
}

variable "max" {
   description = "Max number of EC2"
   type = number
}

variable "min" {
  description = "Min number of EC2"
  type = number
}

variable "desired" {
  description = "Desired number of EC2"
  type = number
}

variable "launch_template_id" {
  description = "Launch template ID"
  type = string
}

variable "launch_template_version" {
  description = "Latest version for template"
  type = string
}