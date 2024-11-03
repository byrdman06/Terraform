variable "al2_ami" {
  description = "Amazon Linux 2 AMI ID"
  type        = string
}

variable "ubuntu_ami" {
  description = "Ubuntu AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "az_1a" {
  description = "AZ us-east-1a for EC2"
  type        = string
}

variable "az_1b" {
  description = "AZ us-east-1b for EC2"
  type        = string
}

variable "key_name" {
  description = "Key pair for EC2"
  type        = string
}

variable "security_groups" {
  description = "List of security groups to attach to EC2"
  type        = list(string)
}

variable "instance_name" {
  description = "Name of EC2"
  type        = string
}

variable "root_volume_size" {
  description = "Size of the root volume"
  type        = number
}
variable "root_volume_type" {
  description = "Type of the root volume"
  type        = string
}

variable "cidr_range_16" {
  description = "CIDR range for VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "cidr_range_subnet1" {
  description = "CIDR range for Subnet 1"
  type        = string
}

variable "cidr_range_subnet2" {
  description = "CIDR range for Subnet 2"
  type        = string
}

variable "subnet_1_name" {
  description = "Name of Subnet 1"
  type        = string
}

variable "subnet_2_name" {
  description = "Name of Subnet 2"
  type        = string
}

variable "igw_name" {
  description = "Name of IGW"
  type        = string
}

variable "route_table_cidr" {
  description = "Route table CIDR block"
  type        = string
}

variable "route_table_name" {
  description = "Name of Route Table"
  type        = string
}