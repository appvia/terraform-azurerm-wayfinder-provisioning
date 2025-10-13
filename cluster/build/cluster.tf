module "aks" {
  source  = "Azure/aks/azurerm"
  version = "9.0.0"

  cluster_name        = var.cloud_resource
  prefix              = var.cloud_resource
  location            = var.location
  resource_group_name = local.resource_group

  
  agents_availability_zones             = ["1", "2", "3"]
  agents_count                          = null
  agents_max_count                      = 10
  agents_max_pods                       = 50
  agents_min_count                      = 2
  agents_pool_name                      = "compute"
  agents_size                           = "Standard_D2s_v3"
  agents_type                           = "VirtualMachineScaleSets"
  api_server_authorized_ip_ranges       = ["0.0.0.0/0"]
  auto_scaler_profile_enabled           = true
  auto_scaler_profile_max_unready_nodes = 1
  azure_policy_enabled                  = true
  enable_auto_scaling                   = true
  enable_host_encryption                = false
  key_vault_secrets_provider_enabled    = false
  kubernetes_version                    = var.kubernetes_version
  net_profile_dns_service_ip            = cidrhost(var.service_cidr, 10)
  net_profile_service_cidr              = var.service_cidr
  network_plugin                        = "azure"
  network_plugin_mode                   = "overlay"
  network_policy                        = "calico"
  oidc_issuer_enabled                   = true
  orchestrator_version                  = var.kubernetes_version
  os_disk_size_gb                       = 50
  os_disk_type                          = "Ephemeral"
  os_sku                                = "Ubuntu"
  net_profile_outbound_type             = "loadBalancer"
  private_cluster_enabled               = false
  private_cluster_public_fqdn_enabled   = false
  rbac_aad                              = true
  rbac_aad_tenant_id  = data.azurerm_client_config.current.tenant_id
  rbac_aad_admin_group_object_ids       = [data.azurerm_client_config.current.object_id]
  rbac_aad_managed                      = true
  role_based_access_control_enabled     = true
  sku_tier                              = "Standard"
  storage_profile_disk_driver_enabled   = true
  storage_profile_disk_driver_version   = "v1"
  vnet_subnet_id                        = var.subnet_id
  identity_ids                          = []
  identity_type                         = "SystemAssigned"
  workload_identity_enabled             = true

  agents_pool_linux_os_configs = [
    {
      transparent_huge_page_enabled = "always"
      sysctl_configs = [
        {
          fs_aio_max_nr               = 65536
          fs_file_max                 = 100000
          fs_inotify_max_user_watches = 1000000
        }
      ]
    }
  ]

  network_contributor_role_assigned_subnet_ids = {
    vnet_subnet = var.subnet_id
  }
}

data "azurerm_kubernetes_cluster" "wayfinder" {
  name                = module.aks.aks_name
  resource_group_name = local.resource_group

  depends_on = [
    module.aks
  ]
}
