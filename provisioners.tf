resource "aws_instance" "my_ec2_instance2" {
    ami = "..."
    instance_type = "t2.micro"
    key_name = "terraform"

    # Add provisioner code
    provisioner "remote-exec" {
     inline = [
         "sudo amazon-linux-extras install -y nginx1.12",
         "sudo system ctl start nginx"
     ]

     connection {
         type = "ssh"
         host = self.public_ip
         user = "ec2-user"
         private_key = "${file("./terraform.pem")}"
     }
    }
}