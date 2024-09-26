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

resource "azurerm_subnets" "AZ-1" {
  name = var.subnets_names.base[0]
  resource_group_name = azurerm_resource_group.base.name
  resource_virtualnetwork = azurerm_virtualnetwork_config.base.name
  address = var.address_values.base[0]
  depends_on = [ 
    azurerm_resource_group.base,
    azurerm_virtualnetwork_config.base
   ]
}

resource "azurerm_subnets" "AZ-2" {
  name = var.subnets_names.base[1]
  resource_group_name = azurerm_resource_group.base.name
  resource_virtualnetwork = azurerm_virtualnetwork_config.base.name
  address = var.address_values.base[1]
  depends_on = [ 
    azurerm_resource_group.base,
    azurerm_virtualnetwork_config.base
   ]
}
resource "azurerm_subnets" "AZ-3" {
  name = var.subnets_names.base[2]
  resource_group_name = azurerm_resource_group.base.name
  resource_virtualnetwork = azurerm_virtualnetwork_config.base.name
  address = var.address_values.base[2]
  depends_on = [ 
    azurerm_resource_group.base,
    azurerm_virtualnetwork_config.base
   ]
}