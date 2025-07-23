# VPC Configuration
resource "aws_vpc" "sanskar_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "sanskar-main-vpc"
  }
}

# Public Subnets
resource "aws_subnet" "sanskar_public_1" {
  vpc_id                  = aws_vpc.sanskar_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "sanskar-public-1"
  }
}

resource "aws_subnet" "sanskar_public_2" {
  vpc_id                  = aws_vpc.sanskar_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "sanskar-public-2"
  }
}

resource "aws_subnet" "sanskar_public_3" {
  vpc_id                  = aws_vpc.sanskar_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1c"

  tags = {
    Name = "sanskar-public-3"
  }
}

# Private Subnets
resource "aws_subnet" "sanskar_private_1" {
  vpc_id                  = aws_vpc.sanskar_vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "sanskar-private-1"
  }
}

resource "aws_subnet" "sanskar_private_2" {
  vpc_id                  = aws_vpc.sanskar_vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "sanskar-private-2"
  }
}

resource "aws_subnet" "sanskar_private_3" {
  vpc_id                  = aws_vpc.sanskar_vpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1c"

  tags = {
    Name = "sanskar-private-3"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "sanskar_igw" {
  vpc_id = aws_vpc.sanskar_vpc.id

  tags = {
    Name = "sanskar-igw"
  }
}

# Public Route Table
resource "aws_route_table" "sanskar_public_rt" {
  vpc_id = aws_vpc.sanskar_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sanskar_igw.id
  }

  tags = {
    Name = "sanskar-public-rt"
  }
}

# Route Table Associations
resource "aws_route_table_association" "sanskar_public_1_assoc" {
  subnet_id      = aws_subnet.sanskar_public_1.id
  route_table_id = aws_route_table.sanskar_public_rt.id
}

resource "aws_route_table_association" "sanskar_public_2_assoc" {
  subnet_id      = aws_subnet.sanskar_public_2.id
  route_table_id = aws_route_table.sanskar_public_rt.id
}

resource "aws_route_table_association" "sanskar_public_3_assoc" {
  subnet_id      = aws_subnet.sanskar_public_3.id
  route_table_id = aws_route_table.sanskar_public_rt.id
}
