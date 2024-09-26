variable "virtualnetwork" {
  type = object({
    name     = string
    location = string
    tags = map(string)
  })
  description = "This variable is used for virtual network creation"
  default = {
    name = "Terraform-virtualNET"
    location = "USeast"
    address = ["10.0.0.0/16"]
  }

}
variable "subnets_names" {
    type =  list (string)
    description = "This is used for list of subnet value names"
    default = [ "app-1", "app-2", "app-3" ]
  
}
variable "address_values" {
    type = list(string)
    description = "This is used for defining list of address values"
    default = [ "10.0.0.0/16", "10.0.1.0/16", "10.0.2.0/16" ]
  
}
