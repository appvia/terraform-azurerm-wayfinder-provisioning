resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name                  = var.nodepool_name
  kubernetes_cluster_id = data.azurerm_kubernetes_cluster.cluster.id
  vm_size               = var.vm_size

  # Node count configuration
  node_count          = var.enable_auto_scaling ? null : var.node_count
  enable_auto_scaling = var.enable_auto_scaling
  min_count           = var.enable_auto_scaling ? var.min_count : null
  max_count           = var.enable_auto_scaling ? var.max_count : null

  # Availability and networking
  zones          = var.availability_zones
  vnet_subnet_id = var.vnet_subnet_id != null ? var.vnet_subnet_id : data.azurerm_kubernetes_cluster.cluster.agent_pool_profile[0].vnet_subnet_id

  # OS configuration
  os_type        = var.os_type
  os_sku         = var.os_sku
  os_disk_size_gb = var.os_disk_size_gb
  os_disk_type    = var.os_disk_type

  # Kubernetes configuration
  orchestrator_version = var.orchestrator_version != null ? var.orchestrator_version : data.azurerm_kubernetes_cluster.cluster.kubernetes_version
  max_pods             = var.max_pods
  node_labels          = var.node_labels
  node_taints          = var.node_taints

  # Security and encryption
  enable_host_encryption = var.enable_host_encryption
  enable_node_public_ip  = var.enable_node_public_ip

  # Spot instances configuration
  priority        = var.priority
  eviction_policy = var.priority == "Spot" ? var.eviction_policy : null
  spot_max_price  = var.priority == "Spot" ? var.spot_max_price : null

  # Storage
  ultra_ssd_enabled = var.ultra_ssd_enabled

  # Linux OS configuration
  dynamic "linux_os_config" {
    for_each = var.linux_os_config != null && var.os_type == "Linux" ? [var.linux_os_config] : []
    content {
      transparent_huge_page_enabled = linux_os_config.value.transparent_huge_page_enabled

      dynamic "sysctl_config" {
        for_each = linux_os_config.value.sysctl_config != null ? [linux_os_config.value.sysctl_config] : []
        content {
          fs_aio_max_nr               = sysctl_config.value.fs_aio_max_nr
          fs_file_max                 = sysctl_config.value.fs_file_max
          fs_inotify_max_user_watches = sysctl_config.value.fs_inotify_max_user_watches
        }
      }
    }
  }

  tags = var.tags
}
