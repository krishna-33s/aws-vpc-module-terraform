output "availability_zones"{
    value = data.aws_availability_zones.available
}

output "vpc_id"{
    value = aws_vpc.main.id
}

output "pubic_subnet"{
    value = aws_vpc.public[*].id
}

output "private_subnet"{
    value = aws_vpc.private[*].id
}

output "database_subnet"{
    value = aws_vpc.database[*].id
}