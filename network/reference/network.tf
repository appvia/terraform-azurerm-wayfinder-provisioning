data "azurerm_virtual_network" "wayfinder" {
  name                = var.virtual_network
  resource_group_name = var.resource_group
}