output "subnet_ids" {
  description = "blank"
  value       = [data.azurerm_subnet.wayfinder.id]
}

output "virtual_network_id" {
  description = "blank"
  value       = data.azurerm_virtual_network.wayfinder.id
}