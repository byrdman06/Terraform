variable "ami" {
  description = "EC2 AMI"
  type = string
}

variable "i_type" {
  description = "Instance type for EC2"
  type = string
}

variable "key_name" {
  description = "Key name for EC2"
  type = string
}

variable "sg_id" {
  description = "Security group for EC2"
  type = string
}