variable "vpc_config" {
  type = object({
    cidr_block           = string
    enable_dns_hostnames = bool
    tags                 = map(string)
  })
  description = "This is for vpc info"

}

# Creating public VPC subnet variables

variable "VPC_Public_Subnets" {
  type = list(object({
    cidr_block           = string
    enable_dns_hostnames = bool
    region               = string
    tags                 = map(string)
  }))
  description = "This is used for creation of public subnets "

}

# Creation of private subnets

variable "VPC_private_subnets" {
  type = list(object({
    cidr_block           = string
    enable_dns_hostnames = bool
    region               = string
    tags                 = map(string)
  }))
  description = "This is used for creation of private networks"

}

# Creation of internet gateway

variable "VPC_IGW" {
  type = object({
    tags = map(string)
  })
  description = "This is for Internet gateway"

}

# Creation of route table

variable "Public_Route_Table" {
  type = object({
    tags = map(string)
  })

  description = "This is for public route table creation"

}

# Creation of private route table

variable "Private_Route_Table" {
  type = object({
    tags = map(string)
  })
  description = "This is for private route table"

}

# Assosication of route tables to subnets (Have doubt in assosication)

# Adding route 

# Adding security groups
variable "Webs_ingress" {
  type = list(object({
    from_port = number
    to_port   = string
    protocol  = string
    tags      = map(string)
  }))

  description = "This defines security groups for web applications"

}

variable "Webs_egress" {
  type = object({
    from_port = number
    to_port   = string
    protocol  = string
    tags      = map(string)
  })
}

variable "Apps_ingress" {
  type = object({
    from_port = number
    to_port   = string
    protocol  = string
    tags      = map(string)
  })

  description = "This defines security groups for  applications"

}

variable "Apps_egress" {
  type = object({
    from_port = number
    to_port   = string
    protocol  = string
    tags      = map(string)
  })
}

variable "dbs_ingress" {
  type = object({
    from_port = number
    to_port   = string
    protocol  = string
    tags      = map(string)
  })

  description = "This defines security groups for db applications"

}

variable "dbs_egress" {
  type = object({
    from_port = number
    to_port   = string
    protocol  = string
    tags      = map(string)
  })
}



