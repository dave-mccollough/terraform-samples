# Map
resource aws_instance "myec2" {
    ami =  "..."
    instance_type = var.types["us-west-2"]
}

# List
resource aws_instance "myec2" {
    ami =  "..."
    instance_type = var.list[0]
}


