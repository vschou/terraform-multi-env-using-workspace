# VPC Creation
resource "aws_vpc" "my-vpc" {
  cidr_block = var.VPC_CIDR
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-vpc"
    environment = "${terraform.workspace}"
  }
}

# 3 Public Subnets Creation
resource "aws_subnet" "pub-sub-1" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.PUB_SUB_1_CIDR
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE1
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-pub-sub-1"
    environment = "${terraform.workspace}"
  }
}
resource "aws_subnet" "pub-sub-2" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.PUB_SUB_2_CIDR
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE2
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-pub-sub-2"
    environment = "${terraform.workspace}"
  }
}
resource "aws_subnet" "pub-sub-3" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.PUB_SUB_3_CIDR
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE3
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-pub-sub-3"
    environment = "${terraform.workspace}"
  }
}

# 3 Private Subnets Creation
resource "aws_subnet" "pvt-sub-1" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.PVT_SUB_1_CIDR
  map_public_ip_on_launch = "false"
  availability_zone = var.ZONE1
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-pvt-sub-1"
    environment = "${terraform.workspace}"
  }
}
resource "aws_subnet" "pvt-sub-2" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.PVT_SUB_2_CIDR
  map_public_ip_on_launch = "false"
  availability_zone = var.ZONE2
  tags = {
    Name ="${var.PROJECT_NAME}-${terraform.workspace}-pvt-sub-2"
    environment = "${terraform.workspace}"
  }
}
resource "aws_subnet" "pvt-sub-3" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.PVT_SUB_3_CIDR
  map_public_ip_on_launch = "false"
  availability_zone = var.ZONE3
  tags = {
    Name ="${var.PROJECT_NAME}-${terraform.workspace}-pvt-sub-3"
    environment = "${terraform.workspace}"
  }
}

# Internet Gateway Creation
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name  = "${var.PROJECT_NAME}-${terraform.workspace}-igw"
    environment = "${terraform.workspace}"
  }
}

# Public Route Table Creation
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-pub-rt"
    environment = "${terraform.workspace}"
  }
}

# Public Route Table Association Creation
resource "aws_route_table_association" "pub-sub-a1" {
  subnet_id = aws_subnet.pub-sub-1.id
  route_table_id = aws_route_table.pub-rt.id
}
resource "aws_route_table_association" "pub-sub-a2" {
  subnet_id = aws_subnet.pub-sub-2.id
  route_table_id = aws_route_table.pub-rt.id
}
resource "aws_route_table_association" "pub-sub-a3" {
  subnet_id = aws_subnet.pub-sub-3.id
  route_table_id = aws_route_table.pub-rt.id
}

# Private Route Table Creation
resource "aws_route_table" "pvt-rt" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-pvt-rt"
    environment = "${terraform.workspace}"
  }
}

# Elastic IP Allocation
resource "aws_eip" "eip" {
  domain = "vpc"
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-eip"
    environment = "${terraform.workspace}"
  }
}

# NAT Gateway Creation
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.pvt-sub-1.id
  tags = {
    Name = "${var.PROJECT_NAME}-${terraform.workspace}-nat"
    environment = "${terraform.workspace}"
  }
}

# Associate NAT Gateway with Private Subnets
resource "aws_route_table_association" "pvt-sub-a1" {
  subnet_id = aws_subnet.pvt-sub-1.id
  route_table_id = aws_route_table.pvt-rt.id
}
resource "aws_route_table_association" "pvt-sub-a2" {
  subnet_id = aws_subnet.pvt-sub-2.id
  route_table_id = aws_route_table.pvt-rt.id
}
resource "aws_route_table_association" "pvt-sub-a3" {
  subnet_id = aws_subnet.pvt-sub-3.id
  route_table_id = aws_route_table.pvt-rt.id
}

# Public Route Creation
resource "aws_route" "pub-route" {
  route_table_id = aws_route_table.pub-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  depends_on = [ aws_vpc.my-vpc ]
}

# Private Route Creation
resource "aws_route" "pvt-route" {
  route_table_id = aws_route_table.pvt-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat-gateway.id
}


