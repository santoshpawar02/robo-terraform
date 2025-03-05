
variable "vpc_security_group_ids" {
  default = []"sg-06f911e3169a4e89a"]
}

variable "instances" {
  default = {
    catalogue = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
    }  
    frontend = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
    }  
    mongo = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.micro"
    }  
  }
}


variable "zone_id" {
  default = "Z004538815W43ZWR1X62I"
}

variable "env" {
  default = "dev"
}