variable  "vpn_ip" {}

variable "instance_type" {}

variable "user_number" {
    type = number
}

variable "elb_name" {
    type = string
}

variable "elb_regions" {
    type = list
}

variable "timeout" {
    type = number
}

variable "list" {
    type = list
    default = ["m5.large", "m5.xlarge", "t2.medium"]
}

variable "types" {
    type = map
    default = {
        us-east-1 = "t2.micro"
        us-west-2 = "t2.nano"
        ap-south-1 = "t2.small"
    }
}

variable "istest" {
    
}

variable "elb_names" {
    type = list
    default = ["dev-loadbalancer", "stage-loadbalancer", "prod-loadbalancer"]
}