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


zone_id = "Z0028833GUFI6MATVQ5L"
vpc_security_group_ids= ["sg-043cf9cc2f3a582e8"]
env = "dev"

eks = {
  main = {
    subnets     = ["subnet-050ab7bcdd357e155", "subnet-01bb79031d4515cab"]
    eks_version = 1.32
    node_groups = {
      main = {
        min_nodes      = 1
        max_nodes      = 10
        instance_types = ["t3.medium", "t2.small"]
      }
    }
  }
}