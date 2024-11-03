variable "ami" {
  type    = string
  default = "ami-0ddc798b3f1a5117e"
}

variable "AZ" {
  type    = string
  default = "us-east-1a"
}

variable "pub_ip_bool" {
  type    = bool
  default = true
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "cwm_key"
}

variable "ec2_name" {
  type    = string
  default = "testvm"
}