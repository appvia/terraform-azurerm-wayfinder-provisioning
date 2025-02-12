variable "cloud_resource" {
  description = "The name of the network to build"
  type = string
}

variable "cidr_node" {
  description = "The ip range for the created network"
  type = string
}

variable "resource_group" {
  description = "The name of the resource group to build"
  type        = string
}

variable "location" {
  description = "The location in which resources are created"
  type        = string
}