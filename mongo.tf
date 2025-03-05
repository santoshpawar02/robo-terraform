resource "aws_instance" "mongo" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-0d84dac6c247a2629"]
  tags = {
    Name = "mongo"
  }
}


resource "aws_route53_record" "mongo" {
  zone_id = "Z051649727R01KQO4G6EL"
  name    = "mongo-prod"
  type    = "A"
  ttl     = 10
  records = [aws_instance.mongo.private_ip]
}

# resource "null_resource" "mongo" {
#   provisioner "remote-exec" {

#     connection {
#       type     = "ssh"
#       user     = "ec2-user"
#       password = "DevOps321"
#       host     = aws_instance.mongo.private_ip
#       }

#     inline = [
#       "sudo pip3.11 install ansible",
#       "ansible-pull -i localhost, -U https://github.com/santoshpawar02/robo-ansible roboshop.yml -e component_name=mongo -e env=prod",
#     ]
#   }
# }