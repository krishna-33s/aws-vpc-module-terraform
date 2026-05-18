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
resource "aws_subnet" "main" {
  count = length(var.cidr_blocks)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_blocks[count.index]
  availability_zone = local.zone_names[count.index]

  tags =merge(
    var.common_tags,
    {
      #roboshop-dev-pubic-us-east-1a
      Name = "${var.project}-${var.env}-${local.zone_names[count.index]}"
    },
    var.public_subnet_tags
  )
}