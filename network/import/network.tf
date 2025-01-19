data "azurerm_virtual_network" "wayfinder" {
  name                = var.existing_network
  resource_group_name = var.resource_group
}

resource "azurerm_subnet" "wayfinder" {
  name                 = "${var.cloud_resource}-nodes"
  resource_group_name  = data.azurerm_virtual_network.wayfinder.resource_group
  virtual_network_name = data.azurerm_virtual_network.wayfinder.name
  address_prefixes     = [var.cidr_node]
}