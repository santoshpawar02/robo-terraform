resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-0acf85a84e4ec3b42"]
  tags = {
    Name = "frontend"
  }
}


resource "aws_route53_record" "frontend" {
  zone_id = "Z05468031XHYNH8NAZQ8Q"
  name    = "frontend-prod"
  type    = "A"
  ttl     = 10
  records = [aws_instance.frontend.private_ip]
}

# resource "null_resource" "frontend" {
#   provisioner "remote-exec" {

#     connection {
#       type     = "ssh"
#       user     = "ec2-user"
#       password = "DevOps321"
#       host     = aws_instance.frontend.private_ip
#       }

#     inline = [
#       "sudo pip3.11 install ansible",
#       "ansible-pull -i localhost, -U https://github.com/santoshpawar02/robo-ansible roboshop.yml -e component_name=frontend -e env=prod",
#     ]
#   }
# }