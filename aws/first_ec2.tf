provider "aws" {
  region     = "us-west-2"
  access_key = "ADD_ACCESS_KEY_HERE"
  secret_key = "ADD_SECRET_ACCESS_KEY_HERE"
}


resource "aws_instance" "my_ec2_instance" {
    ami = "ami-0841edc20334f9287"
    instance_type = "t2.micro"

}