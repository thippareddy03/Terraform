resource "azurerm_resource_group" "base" {
  name = "Terraform-Azure"
  location = "West Europe"
}

resource "azurerm_virtualnetwork_config" "base" {
    name = "Terraform-Azure-Network"
    resource_group_name = azurerm_resource_group.base.name
    location = azurerm_resource_group.base.location
    depends_on = [ 
        azurerm_resource_group.base 
        ]
  
}

# Creating subnets

resource "azurerm_subnets_config" "AZ-1" {
  name = "App-1"
  resource_group_name = azurerm_resource_group.base.name
  resource_virtualnetwork = azurerm_virtualnetwork_config.base.name
  address = [ "10.0.0.0/16" ]
  depends_on = [ 
    azurerm_resource_group.base,
    azurerm_virtualnetwork_config.base
   ]
}