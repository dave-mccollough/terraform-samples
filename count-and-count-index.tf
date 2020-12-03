# Count
resource aws_instance "myec2" {
        ami =  "ami-0841edc20334f9287"
        instance_type = "t2.micro"
        count = 3
}

# Increment the name
resource aws_iam_user "lb" {
    name = "loadbalancer.${count.index}"
    count = 5
    path = "/system/"
}
# loadbalancer.0
# loadbalancer.1
# loadbalancer.3

# Change the name based on a variable
resource aws_iam_user "lb" {
    name = var.elb_names[count.index]
    count = 3
    path = "/system/"
}

variable "elb_names" {
    type = list
    default = ["dev-loadbalancer", "stage-loadbalancer", "prod-loadbalancer"]
}