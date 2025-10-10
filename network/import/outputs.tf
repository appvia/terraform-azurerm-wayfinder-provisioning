output "subnet_ids" {
  description = "A list of the subnets created"
  value       = [azurerm_subnet.wayfinder.id]
}

output "virtual_network_id" {
  description = "The ID of the virtual network that was imported"
  value       = data.azurerm_virtual_network.wayfinder.id
}