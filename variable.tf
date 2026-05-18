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

variable "tags"{
    type = map
    default ={}
}