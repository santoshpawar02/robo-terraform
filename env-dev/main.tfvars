instances = {
    catalogue = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      ansible_role = "catalogue-docker"
    }  
    frontend = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      ansible_role = "frontend-docker"
    }  
    mongo = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
    }  
    redis = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
    }  

    cart = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      ansible_role = "cart-docker"
    }  

    user = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      ansible_role = "user-docker"
    }  

    shipping = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      ansible_role = "shipping-docker"      
    }  

    mysql = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
    }  

    # rabbitmq = {
    #   ami_id = "ami-09c813fb71547fc4f"
    #   instance_type = "t2.small"
    # }
    # payment = {
    #   ami_id        = "ami-09c813fb71547fc4f"
    #   instance_type = "t3.small"
    #   ansible_role = "payment-docker"
    # }
}  


zone_id = "Z0287353XAYGRO4V0YAK"
vpc_security_group_ids= ["sg-09a8de320b53df5e4"]
env = "dev"