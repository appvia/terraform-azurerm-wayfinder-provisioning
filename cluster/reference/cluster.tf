data "azurerm_kubernetes_cluster" "wayfinder" {
  name                = var.cluster_name
  resource_group_name = var.resource_group
}

data "tls_certificate" "wayfinder" {
  url = "https://${data.azurerm_kubernetes_cluster.wayfinder.fqdn}"
  verify_chain=false
}