resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "woodyvpc"
  }
}

resource "aws_subnet" "pubsubnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "woody_pub_subnet1"
  }
}

resource "aws_subnet" "pubsubnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "woody_pub_subnet2"
  }
}

resource "aws_subnet" "privsubnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "woody_priv_subnet1"
  }
}

resource "aws_subnet" "privsubnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "woody_priv_subnet2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "woody_igw"
  }
}

resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "woody_pub_RT"
  }
}

resource "aws_route_table" "priv_route_table" {
  vpc_id = aws_vpc.vpc.id

  #route {
  # cidr_block = "10.0.0.0/16"
  # gateway_id = aws_internet_gateway.igw.id
  # }

  tags = {
    Name = "woody_priv_RT"
  }
}

resource "aws_route_table_association" "pub_sub1_association" {
  subnet_id      = aws_subnet.pubsubnet1.id
  route_table_id = aws_route_table.pub_route_table.id
}

resource "aws_route_table_association" "pub_sub2_association" {
  subnet_id      = aws_subnet.pubsubnet2.id
  route_table_id = aws_route_table.pub_route_table.id
}

resource "aws_route_table_association" "priv_sub1_association" {
  subnet_id      = aws_subnet.privsubnet1.id
  route_table_id = aws_route_table.priv_route_table.id
}

resource "aws_route_table_association" "priv_sub2_association" {
  subnet_id      = aws_subnet.privsubnet2.id
  route_table_id = aws_route_table.priv_route_table.id
}