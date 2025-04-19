resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  root_block_device {
    volume_size = var.root_volume_size
  }

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
  depends_on = [aws_route53_record.record]

  triggers = {
    instance_id_change = aws_instance.instance.id
  }
  
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = data.vault_generic_secret.ssh.data["username"]
      password = data.vault_generic_secret.ssh.data["password"]
      host     = aws_instance.instance.private_ip
    }

    inline = [
      "sudo pip3.11 install ansible hvac",
      "ansible-pull -i localhost, -U https://github.com/santoshpawar02/robo-ansible roboshop.yml -e component_name=${var.ansible_role} -e env=${var.env} -e vault_token=${var.vault_token}" ,
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
# cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
# [kubernetes]
# name=Kubernetes
# baseurl=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/
# enabled=1
# gpgcheck=1
# gpgkey=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
# EOF
# sudo yum install -y kubectl bash-completion
# kubectl version
# echo 'source <(kubectl completion bash)' >>~/.bashrc
# source ~/.bashrc

# kubectl get no
# aws eks update-kubeconfig --name dev
# cat /home/ec2-user/.kube/config
# kubectl cluster-info
# curl -sS https://webinstall.dev/k9s | bash
# # SG n zones n Subnets
# ##EKS does not support creating control plane instances in us-east-1e, the targeted availability zone. Retry cluster creation using control plane subnets that span at least two of these availability zones: us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1f. 
##########################################################################################################################

## 10.hashi-vault learn-ansible git
# [ ec2-user@ip-172-31-19-123 ~/tools-setup-code ]$ ansible-playbook hashi-vault.yml -e vault_token=
# [WARNING]: No inventory was parsed, only implicit localhost is available
# [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

# PLAY [Get secrets from vault] ************************************************************************************************************************************

# TASK [Gathering Facts] *******************************************************************************************************************************************
# ok: [localhost]

# TASK [Print] *****************************************************************************************************************************************************
# ok: [localhost] => {
#     "msg": "demo_username"
# }

# PLAY RECAP *******************************************************************************************************************************************************
# localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


# 54.235.23.104 | 172.31.19.123 | t2.micro | https://github.com/santoshpawar02/tools-setup-code.git
# [ ec2-user@ip-172-31-19-123 ~/tools-setup-code ]$ cat hashi-vault.yml
# - name: Get secrets from vault
#   hosts: localhost
#   connection: local
#   tasks:
#     - name: Print
#       ansible.builtin.debug:
#         msg: "{{ lookup('community.hashi_vault.hashi_vault', 'secret=test/data/demo:username token={{ vault_token }} url=http://vault-internal.santoshpawar.site:8200') }}"

# 54.235.23.104 | 172.31.19.123 | t2.micro | https://github.com/santoshpawar02/tools-setup-code.git

##########################################################################################################################
## ## 07.hashi-vault learn-terraform git

# [ ec2-user@ip-172-31-19-123 ~ ]$ terraform apply -auto-approve -var vault_token= 
# data.vault_generic_secret.secret_data: Reading...
# data.vault_generic_secret.secret_data: Read complete after 0s [id=test/demo]

# Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
#   + create

# Terraform will perform the following actions:

#   # local_file.test will be created
#   + resource "local_file" "test" {
#       + content              = (sensitive value)
#       + content_base64sha256 = (known after apply)
#       + content_base64sha512 = (known after apply)
#       + content_md5          = (known after apply)
#       + content_sha1         = (known after apply)
#       + content_sha256       = (known after apply)
#       + content_sha512       = (known after apply)
#       + directory_permission = "0777"
#       + file_permission      = "0777"
#       + filename             = "/tmp/1"
#       + id                   = (known after apply)
#     }

# Plan: 1 to add, 0 to change, 0 to destroy.
# local_file.test: Creating...
# local_file.test: Creation complete after 0s [id=75907059570d03042d05da3e7bf0a2da3a5d5f37]

# Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

# 54.235.23.104 | 172.31.19.123 | t2.micro | null
# [ ec2-user@ip-172-31-19-123 ~ ]$ cat /tmp/1
# demo_username
# 54.235.23.104 | 172.31.19.123 | t2.micro | null
# [ ec2-user@ip-172-31-19-123 ~ ]$ cat hashi-vault-TF.tf
# provider "vault" {
#   address = "http://vault-internal.santoshpawar.site:8200"
#   token = var.vault_token
# }

# variable "vault_token" {}

# data "vault_generic_secret" "secret_data" {
#   path = "test/demo"
# }

# resource "local_file" "test" {
#   filename = "/tmp/1"
#   content = data.vault_generic_secret.secret_data.data["username"]
# }


# 54.235.23.104 | 172.31.19.123 | t2.micro | null
# [ ec2-user@ip-172-31-19-123 ~ ]$
##########################################################################################################################
