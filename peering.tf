resource "aws_vpc_peering_connection" "foo" {
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