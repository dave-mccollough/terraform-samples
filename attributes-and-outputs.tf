resource aws_eip "lb" {
    vpc = true
}

output "eip" {
    # value = aws_eip.lb.public_ip
    value = aws_eip.lb
}

resource aws_s3_bucket "s3_bucket" {
    bucket = "dave-attribute-demo-001"
}

output "mys3Bucket" {
    # value = aws_s3_bucket.s3_bucket.bucket_domain_name
    value = aws_s3_bucket.s3_bucket
}
