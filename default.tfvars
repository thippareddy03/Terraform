vpc_config = {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
  tags = {
    name = "Terraform-AWS"
  }
}

VPC_Public_Subnets = [{
  cidr_block           = "172.31.32.0/20"
  enable_dns_hostnames = true
  region               = "us-east-1e"
  tags = {
    "name" = "web-1"
  }
  },
  {
    cidr_block           = "172.31.64.0/20"
    enable_dns_hostnames = true
    region               = "us-east-1d"
    tags = {
      "name" = "web-2"
    }
}]

VPC_private_subnets = [{
  cidr_block           = "172.31.0.0/20"
  enable_dns_hostnames = true
  region               = "us-east-1a"
  tags = {
    "name" = "app-1"
  }
  },
  {
    cidr_block           = "172.31.80.0/20"
    enable_dns_hostnames = true
    region               = "us-east-1b"
    tags = {
      "name" = "app-2"
    }
  },
  {
    cidr_block           = "172.31.48.0/20"
    enable_dns_hostnames = true
    region               = "us-east-1c"
    tags = {
      "name" = "db-1"
    }
}]

VPC_IGW = {
  tags = {
    "name" = "InternetGateWay"
  }
}

Public_Route_Table = {
  tags = {
    "name" = "Public"
  }
}

Public_Route_Table = {
  tags = {
    "name" = "Private"
  }
}

Webs_ingress = [ {
  from_port = 80
  to_port = "0.0.0.0/0"
  protocol = "tcp"
  tags = {
    "name" = "This opens 80 port"
  }
},
{
  from_port = 22
  to_port = "0.0.0.0/0"
  protocol = "tcp"
  tags = {
    "name" = "This opens 22 port"
  }
} ]

Webs_egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

Apps_ingress = {
  from_port = 8000
  to_port = "0.0.0.0/0"
  protocol = "tcp"
  tags = {
    "name" = "This opens 8000 port"
}
}
Apps_egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

dbs_ingress = {
  from_port = 3306
  to_port = "0.0.0.0/0"
  protocol = "tcp"
  tags = {
    "name" = "This opens 3306 port"  
}
}
dbs_egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

