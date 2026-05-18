locals {
    common_tags = {
        Project = var.project
        Environment = var.env
        Terraform = "true"
    }
    final_tags = merge(
        local.common_tags,
        {
            Name = "${var.project}"-"${var.env}"
        },
        var.tags
    )
}