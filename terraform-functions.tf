provider "aws" {

}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "..."
    "us-west-2" =  "..."
    "ap-south-1" =  "..."
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
    # Lookup function:  lookup(map value, key value)
    # in this case lookup(ami value where, region is)
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   key_name = aws_key_pair.loginkey.key_name
   count = 2

   tags = {
    #  Element function - retreives a single element from a list 
    # In this case:  element(get tag where, specific index)  
     Name = element(var.tags,count.index)
   }
}


output "timestamp" {
  value = local.time
}