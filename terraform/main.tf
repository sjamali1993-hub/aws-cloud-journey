terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "jamali" {
  cidr_block = var.vpc_cidr
    tags = {
        Name = "vpc-${var.vpc_name}-terraform"
    }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.jamali.id
  cidr_block = var.subnet_public_cidr
  availability_zone = "eu-west-3a"
  map_public_ip_on_launch = true
    tags = {
        Name = "subnet-public-${var.vpc_name}-terraform"
    }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.jamali.id
  cidr_block = var.subnet_private_cidr
  availability_zone = "eu-west-3b"
  map_public_ip_on_launch = false
    tags = {
        Name = "subnet-private-${var.vpc_name}-terraform"
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.jamali.id
    tags = {
        Name = "igw-${var.vpc_name}-terraform"
    }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.jamali.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "rt-public-${var.vpc_name}-terraform"
    }
  
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
    domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.public.id
    tags = {
        Name = "nat-${var.vpc_name}-terraform"
    } 
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.jamali.id
    
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }

    tags = {
        Name = "rt-private-${var.vpc_name}-terraform"
    }
  
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}