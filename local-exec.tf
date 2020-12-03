resource "aws_instance" "my_ec2_instance" {
    ami = "..."
    instance_type = "t2.micro"
  
    provisioner "local-exec" {

    command = "echo ${aws_instance.my_ec2_instance.private_ip} >> private_ip.txt"
    
    }
}
