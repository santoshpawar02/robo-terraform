instances = {
    catalogue = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      ansible_role = "catalogue-docker"
      root_volume_size = 30
    }  
    frontend = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      ansible_role = "frontend-docker"
      root_volume_size = 30
    }  
    mongo = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      root_volume_size = 20
    }  
    redis = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      root_volume_size = 20
    }  

    cart = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      ansible_role = "cart-docker"
      root_volume_size = 30
    }  

    user = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      ansible_role = "user-docker"
      root_volume_size = 30

    }  

    shipping = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      ansible_role = "shipping-docker"      
      root_volume_size = 30
    }  

    mysql = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t2.small"
      root_volume_size = 20
    }  

    # rabbitmq = {
    #   ami_id = "ami-09c813fb71547fc4f"
    #   instance_type = "t2.small"
    #   root_volume_size = 20  
    # }
    # payment = {
    #   ami_id        = "ami-09c813fb71547fc4f"
    #   instance_type = "t3.small"
    #   ansible_role = "payment-docker"
    #   root_volume_size = 30
    # }
}  


zone_id = "Z01890483QZ973ISPZQBO"
vpc_security_group_ids= ["sg-0d0523dbd15d20a24"]
env = "dev"

eks = {
  main = {
    subnets     = ["subnet-0f10014fe8a9d8f66", "subnet-0600f17f86a512c58"]
    eks_version = 1.32
    node_groups = {
      main = {
        min_nodes      = 3
        max_nodes      = 5
        instance_types = ["t3.medium", "t2.small"]
      }
    }  

    addons = {
      metrics-server = {}
      eks-pod-identity-agent = {}
    }

  }
}