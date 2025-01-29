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
  value = nonsensitive(length(data.azurerm_kubernetes_cluster.wayfinder.kube_config) > 0 ? data.azurerm_kubernetes_cluster.wayfinder.kube_config[0].cluster_ca_certificate : data.azurerm_kubernetes_cluster.wayfinder.kube_admin_config[0].cluster_ca_certificate)
}

output "principal_id" {
  description = "blank"
  value = "static"
}

output "raw_config" {
  description = "blank"
  value = nonsensitive(data.azurerm_kubernetes_cluster.wayfinder.kube_config_raw)
}