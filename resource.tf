resource "azurerm_resource_group" "base" {
  name = var.resource_group.name
  location = var.resource_group.location
}

resource "azurerm_virtualnetwork_config" "base" {
    name = var.virtualnetwork.name
    resource_group_name = azurerm_resource_group.base.name
    location = azurerm_resource_group.base.location
    depends_on = [ 
        azurerm_resource_group.base 
        ]
  
}

# Creating subnets

resource "azurerm_subnets" "Azure" {
  count = length(var.subnet_config)
  name = var.subnet_config[count.index].name
  resource_group_name = azurerm_resource_group.base.name
  resource_virtualnetwork = azurerm_virtualnetwork_config.base.name
  address = var.subnet_config[count.index].address
  location = var.subnet_config[count.index].location
  depends_on = [ 
    azurerm_resource_group.base,
    azurerm_virtualnetwork_config.base
   ]
}