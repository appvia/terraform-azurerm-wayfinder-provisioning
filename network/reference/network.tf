data "azurerm_virtual_network" "wayfinder" {
  name                = var.virtual_network
  resource_group_name = var.resource_group
}

data "azurerm_subnet" "wayfinder" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group
  virtual_network_name = var.virtual_network
}