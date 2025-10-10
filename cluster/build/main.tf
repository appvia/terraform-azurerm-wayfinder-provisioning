data "azurerm_subscription" "primary" {}

data "azurerm_client_config" "current" {}

locals {
	resource_group = var.resource_group == "" ? "wf-${var.cloud_resource}-${var.location}" : var.resource_group

	infra_resource_group = var.infra_resource_group == "" ? "wf-${var.cloud_resource}-infra-${var.location}" : var.infra_resource_group
}