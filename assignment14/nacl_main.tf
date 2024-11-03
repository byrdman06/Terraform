# data "aws_vpc" "existing_vpc" {
#   id = "vpc-0a5373b912e8cdc7b"
# }

# resource "aws_network_acl" "allow_ssh_https_nfs" {
#   vpc_id = data.aws_vpc.existing_vpc.id
#   subnet_ids = []

#   ingress {
#     rule_no    = 100
#     action     = "allow"
#     protocol   = "tcp"
#     from_port  = 22
#     to_port    = 22
#     cidr_block = "172.31.0.0/16"
#   }

#   ingress {
#     rule_no    = 101
#     action     = "allow"
#     protocol   = "tcp"
#     from_port  = 443
#     to_port    = 443
#     cidr_block = "172.31.0.0/16"
#   }

#   ingress {
#     rule_no    = 102
#     action     = "allow"
#     protocol   = "tcp"
#     from_port  = 2049
#     to_port    = 2049
#     cidr_block = "172.31.0.0/16"
#   }

#   egress {
#     rule_no    = 100
#     action     = "allow"
#     protocol   = "-1"
#     from_port  = 0
#     to_port    = 0
#     cidr_block = "172.31.0.0/16"
#   }
# }