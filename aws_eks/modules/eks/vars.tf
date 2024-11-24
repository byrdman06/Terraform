variable "eksclustername" {
  description = "Name of the EKS Cluster"
  type = string
}

variable "aws_eks_role" {
  description = "EKS Role ARN"
  type = string
}

variable "subnet1id" {
  description = "Subnet 1 ID"
  type = string
}

variable "subnet2id" {
  description = "Subnet 2 ID"
  type = string
}

variable "eksnodegroupname" {
  description = "EKS node group name"
  type = string
}

variable "aws_eksnodegrouprole" {
  description = "AWS EKS group role"
  type = string
}