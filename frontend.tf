resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-0acf85a84e4ec3b42"]
  tags = {
    Name = "frontend"
  }
}