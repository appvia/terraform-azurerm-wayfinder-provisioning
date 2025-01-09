output "fqdn" {
  description = "The domain name of the kubernetes cluster"
  value       = data.azurerm_kubernetes_cluster.wayfinder.fqdn
}

output "resource_group" {
  description = "The resource group of the kubernetes cluster"
  value = var.resource_group
}

output "cluster_name" {
  description = "The name of the kubernetes cluster"
  value = var.cluster_name
}

output "ca_certificate" {
  description = "The ca certificate of the kubernetes cluster"
  value = nonsensitive(length(data.azurerm_kubernetes_cluster.wayfinder.kube_config) > 0 ? data.azurerm_kubernetes_cluster.wayfinder.kube_config.0.cluster_ca_certificate : "")
}

output "infra_resource_group" {
  description = "The infra resource group of the kubernetes cluster"
  value = data.azurerm_kubernetes_cluster.wayfinder.node_resource_group
}

output "kubernetes_version" {
  description = "The version of the kubernetes cluster"
  value = data.azurerm_kubernetes_cluster.wayfinder.kubernetes_version
}

output "principal_id" {
  description = "The principal id of the kubernetes cluster"
  value = data.azurerm_kubernetes_cluster.wayfinder.identity.0.principal_id
}
