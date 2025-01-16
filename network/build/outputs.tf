output "subnet_ids" {
  description = "blank"
  value       = [azurerm_subnet.wayfinder.id]
}

output "virtual_network_id" {
  description = "blank"
  value       = azurerm_virtual_network.wayfinder.id
}