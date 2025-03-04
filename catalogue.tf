resource "aws_instance" "catalogue" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-0acf85a84e4ec3b42"]
  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z05468031XHYNH8NAZQ8Q"
  name    = "catalogue-prod"
  type    = "A"
  ttl     = 10
  records = [aws_instance.catalogue.private_ip]
}