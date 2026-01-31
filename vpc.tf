resource "aws_vpc" "main_vpc" {
  cidr_block = "10.20.10.0/24"
  tags = {
    Name = "main_vpc"
  }
}
resource "aws_subnet" "subnet1" {
  cidr_block = "10.20.10.0/28"
  vpc_id     = aws_vpc.main_vpc.id
}
resource "aws_subnet" "subnet2" {
  cidr_block = "10.20.10.16/28"
  vpc_id     = aws_vpc.main_vpc.id
}
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "route_table"
  }
}
resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}
resource "aws_route_table_association" "subnet_route_table_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table.id
}
resource "aws_route_table_association" "subnet_route_table_association2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.route_table.id
}
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "internet_gateway"
  }
}