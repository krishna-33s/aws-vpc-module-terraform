# vpc creation
resource "aws_vpc" "main" {
  cidr_block       = var.cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = local.final_vpc_tags
}

# internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = local.final_ig_tags
}

#public subnet
resource "aws_subnet" "public" {
  count = length(var.cidr_blocks)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr_blocks[count.index]
  availability_zone = local.zone_names[count.index]
  map_public_ip_on_launch = true

  tags =merge(
    local.common_tags,
    {
      #roboshop-dev-pubic-us-east-1a
      Name = "${var.project}-${var.env}-public-${local.zone_names[count.index]}"
    },
    var.public_subnet_tags
  )
}

#private subnet
resource "aws_subnet" "private" {
  count = length(var.cidr_blocks)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr_blocks[count.index]
  availability_zone = local.zone_names[count.index]

  tags =merge(
    local.common_tags,
    {
      #roboshop-dev-private-us-east-1a
      Name = "${var.project}-${var.env}-private-${local.zone_names[count.index]}"
    },
    var.private_subnet_tags
  )
}

#database subnet
resource "aws_subnet" "database" {
  count = length(var.cidr_blocks)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_cidr_blocks[count.index]
  availability_zone = local.zone_names[count.index]

  tags =merge(
    local.common_tags,
    {
      #roboshop-dev-database-us-east-1a
      Name = "${var.project}-${var.env}-database-${local.zone_names[count.index]}"
    },
    var.database_subnet_tags
  )
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    {
      #roboshop-dev-public
      Name = "${var.project}-${var.env}-public"
    },
    var.public_route_table_tags
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    {
      #roboshop-dev-private
      Name = "${var.project}-${var.env}-private"
    },
    var.private_route_table_tags
  )
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    {
      #roboshop-dev-database
      Name = "${var.project}-${var.env}-database"
    },
    var.database_route_table_tags
  )
}