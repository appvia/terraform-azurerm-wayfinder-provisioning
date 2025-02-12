variable "location" {
  description = "The location to build the cluster"
  type = string
}

variable "cloud_resource" {
  description = "The name to use for any created cloud resources"
  type = string
}

variable "resource_group" {
  description = "The resource group to build this cluster in"
  type        = string
  default = ""
}

variable "infra_resource_group" {
  description = "The resource group to use for cluster infrastructure"
  type = string
  default = ""
}

variable "kubernetes_version" {
  description = "The version of kubernetes used to build this cluster"
  type = string
}

variable "subnet_ids" {
  description = ""
  type = list
}

variable "service_cidr" {
  description = ""
  type = string
  default = "172.16.0.0/16"
}

