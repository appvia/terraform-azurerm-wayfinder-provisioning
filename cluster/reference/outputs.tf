output "fqdn" {
  description = "blank"
  value       = data.azurerm_kubernetes_cluster.wayfinder.fqdn
}

output "resource_group" {
  description = "blank"
  value = var.resource_group
}

output "infra_resource_group" {
  description = "blank"
  value = "static"
}

output "kubernetes_version" {
  description = "blank"
  value = "static"
}

output "ca_certificate" {
  description = "blank"
  value = data.azurerm_kubernetes_cluster.wayfinder.kube_config[0].cluster_ca_certificate
}

output "principal_id" {
  description = "blank"
  value = "static"
}