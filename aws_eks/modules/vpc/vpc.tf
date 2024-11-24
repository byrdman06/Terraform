resource "aws_vpc" "tf_vpc" {
  cidr_block           = var.vpccidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpcname
  }
}

resource "aws_subnet" "tf_subnet1" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.subnet1cidr
  availability_zone       = var.subnet1az
  map_public_ip_on_launch = true
  tags = {
    Name = "tf_subnet_test1"
  }
}

resource "aws_subnet" "tf_subnet2" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.subnet2cidr
  availability_zone       = var.subnet2az
  map_public_ip_on_launch = true
  tags = {
    Name = "tf_subnet_test2"
  }
}

resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "tf_igw_test"
  }

}

resource "aws_route_table" "tf_rt" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }

  tags = {
    Name = "tf_rt_test"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.tf_subnet1.id
  route_table_id = aws_route_table.tf_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.tf_subnet2.id
  route_table_id = aws_route_table.tf_rt.id
}