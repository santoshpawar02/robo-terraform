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

# resource "null_resource" "catalogue" {
#   provisioner "remote-exec" {

#     connection {
#       type     = "ssh"
#       user     = "ec2-user"
#       password = "DevOps321"
#       host     = aws_instance.catalogue.private_ip
#       }

#     inline = [
#       "sudo pip3.11 install ansible",
#       "ansible-pull -i localhost, -U https://github.com/santoshpawar02/robo-ansible roboshop.yml -e component_name=catalogue -e env=prod",
#     ]
#   }
# }