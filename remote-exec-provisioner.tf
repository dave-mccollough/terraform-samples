
resource "aws_instance" "my_ec2_instance" {
    ami = "..."
    instance_type = "t2.micro"
    key_name = "name of your key"

    provisioner "remote-exec" {
    
    inline = [
        # Command 1
        # Command 2
        "sudo amazon-linux-extras install -y nginx1.12",
        "sudo systemctl start nginx"
    ]

    connection {
        type = "ssh"
        user = "ec2-user"
        # You can use a password or download a key from the provider.  If you use a key, define as such
        private-key = file( "./private_key_name.pem")
        password = "${var.root_password}"
    }
}
