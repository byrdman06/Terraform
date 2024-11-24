variable "vpccidr" {
  description = "The CIDR range for VPC"
  type = string
}

variable "vpcname" {
  description = "The name of the VPC"
  type = string
}

variable "subnet1cidr" {
  description = "Subnet 1 CIDR"
  type = string
}

variable "subnet1az" {
  description = "Subnet 1 AZ"
  type = string
}

variable "subnet2cidr" {
  description = "Subnet 2 CIDR"
  type = string
}

variable "subnet2az" {
    description = "Subnet 2 AZ"
    type = string
}

variable "sgname" {
  description = "Name of the SG"
  type = string
}