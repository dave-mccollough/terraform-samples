resource aws_instance "my_ec2" {
    ami = "..."
    instance_type = "t2.micro"
}

resource aws_eip "lb" {
    vpc = true
}

resource aws_eip_association "eip_assoc" {
    instance_id = aws_instance.my_ec2.id
    allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
  name        = "daves-sg"

# Ingress = inbound
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # Use this approach to combine a variable with a string
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }

Egress = outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}