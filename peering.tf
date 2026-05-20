resource "aws_vpc_peering_connection" "main" {
  count= var.vpc_peering? 1 : 0

  peer_vpc_id   = data.aws_vpc.default.id
  vpc_id        = aws_vpc.main.id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = merge(
    local.common_tags,
    {
      #roboshop-default-dev
      Name = "${var.project}-default-${var.env}"
    },
    var.peering_tags
  )
}

resource "aws_route" "public_peer_route" {
  count= var.vpc_peering? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}


resource "aws_route" "default_peer_route" {
  count= var.vpc_peering? 1 : 0
  route_table_id            = data.aws_route_table.main.id
  destination_cidr_block    = var.cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}
