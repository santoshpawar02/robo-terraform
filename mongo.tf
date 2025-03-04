resource "aws_instance" "mongo" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-0acf85a84e4ec3b42"]
  tags = {
    Name = "mongo"
  }
}

resource "aws_route53_record" "mongo" {
  zone_id = "Z05468031XHYNH8NAZQ8Q"
  name    = "mongo-prod"
  type    = "A"
  ttl     = 10
  records = [aws_instance.mongo.private_ip]
}