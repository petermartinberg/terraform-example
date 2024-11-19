provider "aws" {
  region = var.region.id
}



resource "aws_vpc" "main-vpc" {
  cidr_block = var.aws_vpc_cidr_block.id
  tags = {
    Name = "project-18-11-2024-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = var.public_subnet_cidr.id
  availability_zone       = var.availability_zone.id
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw-main" {
  vpc_id = aws_vpc.main-vpc.id
}

resource "aws_route_table" "rt-main" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = var.aws_rt_cidr_block.id
    gateway_id = aws_internet_gateway.igw-main.id
  }
}

resource "aws_route_table_association" "rt-main-ass" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.rt-main.id
}


output "aws_vpc.main-vpc.id" {
  value = aws_vpc.main-vpc.id
}