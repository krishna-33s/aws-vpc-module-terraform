locals {
    common_tags = {
        Project = var.project
        Environment = var.env
        Terraform = "true"
    }
    final_vpc_tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.env}"
        },
        var.vpc_tags
    )
    final_ig_tags=merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.env}"
        },
        var.ig_tags
    )

    zone_names = slice(data.aws_availability_zones.available.names,0,2)
    

}