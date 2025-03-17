resource "azurerm_resource_group" "wayfinder" {
  lifecyle {
    prevent_destroy = var.prevent_destroy
  }
  
  name     = var.resource_group
  location = var.location
}

resource "azurerm_virtual_network" "wayfinder" {
  name = var.cloud_resource
  location = var.location
  resource_group_name = azurerm_resource_group.wayfinder.name
  address_space = [var.cidr_node]
}

resource "azurerm_subnet" "wayfinder" {
  name                 = "${var.cloud_resource}-nodes"
  resource_group_name  = azurerm_resource_group.wayfinder.name
  virtual_network_name = azurerm_virtual_network.wayfinder.name
  address_prefixes     = [var.cidr_node]
}