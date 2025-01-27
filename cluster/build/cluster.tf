data "azurerm_virtual_network" "wayfinder" {
  name                = var.existing_network
  resource_group_name = var.resource_group
}