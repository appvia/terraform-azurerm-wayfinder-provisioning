variable "virtual_network" {
  description = "The name of the vnet we are importing"
  type = string
}

variable "cloud_resource" {
  description = "The name used for any cloud resources we create"
  type = string
}

variable "cidr_node" {
  description = "The ip range for the created network"
  type = string
}

variable "resource_group" {
  description = "The resource group of the vnet we are importing"
  type        = string
}