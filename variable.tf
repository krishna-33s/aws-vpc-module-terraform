variable "project"{
    type = string
}

variable "env"{
    type = string
}

variable "cidr"{
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_tags"{
    type = map
    default ={}
}

variable "ig_tags"{
    type = map
    default ={}
}

variable "cidr_blocks"{
    type = list
    default =["10.0.1.0/24", "10.0.11.0/24"]
}

variable "public_subnet_tags"{
    type = map
    default = {}
}

variable "private_subnet_tags"{
    type = map
    default = {}
}

variable "database_subnet_tags"{
    type = map
    default = {}
}

variable "public_route_table_tags" {
    type = map
    default = {}
}

variable "private_route_table_tags" {
    type = map
    default = {}
}

variable "database_route_table_tags" {
    type = map
    default = {}
}