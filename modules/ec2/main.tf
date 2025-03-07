resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = var.name  
  }
}


resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name    = "${var.name}-${var.env}"
  type    = "A"
  ttl     = 10
  records = [aws_instance.instance.private_ip]
}

resource "null_resource" "catalogue" {
  depends_on = [ aws_route53_record.record ]
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }

    inline = [
      "sudo pip3.11 install ansible hvac",
      "ansible-pull -i localhost, -U https://github.com/santoshpawar02/robo-ansible roboshop.yml -e component_name=${var.name} -e env=${var.env}",
    ]
  }
}


# sudo yum install -y yum-utils
# sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
# sudo yum -y install terraform
# pip3.11 install ansible
# pip3.11 install hvac




# sudo fdisk /dev/xvda
# sudo pvcreate /dev/xvda5
# sudo vgs
# sudo vgextend RootVG /dev/xvda5
# sudo vgs
# sudo lvextend -L +9G /dev/RootVG/homeVol
# sudo xfs_growfs /dev/RootVG/homeVol
# sudo df -h