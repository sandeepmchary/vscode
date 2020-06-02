# --- Nat gw ---
resource "aws_eip" "nat" {
  vpc = "true"
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.udemy-public-1.id
  depends_on = ["aws_internet_gateway.main-igw"]
}
# vpc setup for nat
resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = "main-private-1"
  }
}
resource "aws_route_table_association" "main-private-1-a" {
  route_table_id = aws_route_table.main-private.id
  subnet_id = aws_subnet.udemy-private-1.id
}
resource "aws_route_table_association" "main-private-2-a" {
  route_table_id = aws_route_table.main-private.id
  subnet_id = aws_subnet.udemy-private-2.id
}
resource "aws_route_table_association" "main-private-3-a" {
  route_table_id = aws_route_table.main-private.id
  subnet_id = aws_subnet.udemy-private-3.id
}
resource "aws_s3"