output "nodepool_id" {
  description = "The ID of the Kubernetes cluster node pool"
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.id
}

output "nodepool_name" {
  description = "The name of the Kubernetes cluster node pool"
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.name
}

output "max_count" {
  description = "The maximum number of nodes in the node pool"
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.max_count
}

output "min_count" {
  description = "The minimum number of nodes in the node pool"
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.min_count
}

output "node_count" {
  description = "The current number of nodes in the node pool"
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.node_count
}

output "vm_size" {
  description = "The size of the Virtual Machines used in the node pool"
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.vm_size
}

output "orchestrator_version" {
  description = "The version of Kubernetes running on the node pool"
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.orchestrator_version
}
