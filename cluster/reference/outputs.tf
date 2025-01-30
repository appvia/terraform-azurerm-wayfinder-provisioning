output "fqdn" {
  description = "blank"
  value       = data.azurerm_kubernetes_cluster.wayfinder.fqdn
}

output "resource_group" {
  description = "blank"
  value = var.resource_group
}

output "cluster_name" {
  description = "blank"
  value = var.cluster_name
}

output "ca_certificate" {
  description = "blank"
  value = nonsensitive(length(data.azurerm_kubernetes_cluster.wayfinder.kube_config) > 0 ? data.azurerm_kubernetes_cluster.wayfinder.kube_config.0.cluster_ca_certificate : "")
}

output "infra_resource_group" {
  description = "blank"
  value = data.azurerm_kubernetes_cluster.wayfinder.node_resource_group
}

output "kubernetes_version" {
  description = "blank"
  value = data.azurerm_kubernetes_cluster.wayfinder.kubernetes_version
}

output "principal_id" {
  description = "blank"
  value = data.azurerm_kubernetes_cluster.wayfinder.identity.0.principal_id
}

