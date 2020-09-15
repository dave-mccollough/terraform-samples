provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAWK3FAWBROJGHJZP5"
  secret_key = "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"
}


resource "aws_instance" "my_ec2_instance" {
    ami = "ami-0841edc20334f9287"
    instance_type = "t2.micro"

}