#--- VPC ---
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = default
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
  enable_classiclink = "false"
  tags = {
      Name = "udemy"
  }
}
# --- subnets ---

resource "aws_subnet" "udemy-public-1" {

  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2a"
  tags = {
    Name = "main-public-1"
  }
}
resource "aws_subnet" "udemy-public-2" {

  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2b"
  tags = {
    Name = "main-public-2"
  }
}
resource "aws_subnet" "udemy-public-3" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2c"
}
resource "aws_subnet" "udemy-private-1" {
  cidr_block = "10.0.4.0/24"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-2a"
  tags = {
    Name = "main=private-1"
  }
}
resource "aws_subnet" "udemy-private-2" {
  cidr_block = "10.0.5.0/24"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-2b"
  tags = {
    Name = "main-private-2"
  }
}
resource "aws_subnet" "udemy-private-3" {
  cidr_block = "10.0.6.0/24"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-2c"
  tags = {
    Name = "udemy-private-3"
  }
}
# --- Internet Gateway ----
resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "udemy"
  }
}
# --- Route tables ---
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }
  tags = {
    Name = "main-public-1"
  }
}
#------------- route associate public ---------
resource "aws_route_table_association" "main-public-1-a" {
  route_table_id = aws_route_table.main-public.id
  subnet_id = aws_subnet.udemy-public-1.id
}
resource "aws_route_table_association" "main-public-2-a" {
  route_table_id = aws_route_table.main-public.id
  subnet_id = aws_subnet.udemy-public-2.id
}
resource "aws_route_table_association" "main-public-3-a" {
  route_table_id = aws_route_table.main-public.id
  subnet_id = aws_subnet.udemy-public-3.id
}


