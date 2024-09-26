variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  default = {
    name     = "Terraform-Azure"
    location = "West Europe"
  }

}
variable "virtualnetwork" {
  type = object({
    name     = string
    location = string
    address  = string
  })
  description = "This variable is used for virtual network creation"
  default = {
    name     = "Terraform-virtualNET"
    location = "USeast"
    address  = ["10.0.0.0/16"]
  }

}
variable "subnet_config" {
  type = list(object({
    name     = string
    address  = string
    location = string
  }))
  default = [{
    address        = "172.31.48.0/20"
    name              = "subnet-1"
    availability_zone = "us-east-1e"
    },
    {
      address        = "172.32.48.0/20"
      name              = "subnet-2"
      availability_zone = "us-east-1d"
    },
    {
      address        = "172.33.48.0/20"
      name              = "subnet-2"
      availability_zone = "us-east-1d"
    }
  ]

}
