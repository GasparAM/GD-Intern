output "gateway" {
    value = aws_internet_gateway.tf
}

output "route_table" {
    value = aws_route_table.tf
}

output "vpc" {
    value = aws_vpc.tf
}

output "security_group" {
    value = aws_security_group.tf
}

output "subnet" {
    value = aws_subnet.tf
}