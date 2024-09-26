variable "VPC_Config" {
  type = object({
    cidr_block = string
    tags       = map(string)
  })
  description = "This is used for vpc configration"
  default = {
    cidr_block = "172.31.0.0/16"
    tags = {
      Name = "Terraform-Variable"
    }
  }

}

# Creation of subnets #[ "172.31.48.0/20","172.31.32.0/20", "172.31.64.0/20", "172.31.16.0/20" ]

variable "Subnet_config" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
    tags              = map(string)
  }))
  default = [{
    cidr_block = "172.31.48.0/20"
    tags = {
      Name = "Subnet1"
    }
    availability_zone = "us-east-1e"
    },
    {
      cidr_block = "172.31.32.0/20"
      tags = {
        Name = "Subnet2"
      }
      availability_zone = "us-east-1d"
    },
    {
      cidr_block = "172.31.64.0/20"
      tags = {
        Name = "Subnet3"
      }
      availability_zone = "us-east-1f"
    },
    {
      cidr_block = "172.31.16.0/20"
      tags = {
        Name = "Subnet4"
      }
      availability_zone = "us-east-1a"
  }]

}
