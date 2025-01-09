output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = [azurerm_subnet.wayfinder.id]
}

output "virtual_network_id" {
  description = "The ID of the created virtual network"
  value       = azurerm_virtual_network.wayfinder.id
}