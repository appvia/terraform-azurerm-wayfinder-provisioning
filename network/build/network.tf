resource "azurerm_resource_group" "wayfinder" {
  name     = var.resource_group_name
  location = var.location
}