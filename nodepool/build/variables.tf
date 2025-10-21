variable "cluster_name" {
  description = "The name of the AKS cluster to add the node pool to"
  type        = string
}

variable "resource_group" {
  description = "The resource group containing the AKS cluster"
  type        = string
}

variable "nodepool_name" {
  description = "The name of the node pool"
  type        = string
}

variable "node_count" {
  description = "The initial number of nodes in the node pool (used when autoscaling is disabled)"
  type        = number
  default     = null
}

variable "vm_size" {
  description = "The size of the Virtual Machines to create as part of the node pool"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "availability_zones" {
  description = "A list of availability zones to spread the node pool across"
  type        = list(string)
  default     = ["1", "2", "3"]
}

variable "enable_auto_scaling" {
  description = "Should the Kubernetes Auto Scaler be enabled for this node pool"
  type        = bool
  default     = true
}

variable "min_count" {
  description = "The minimum number of nodes which should exist in this node pool (required when enable_auto_scaling is true)"
  type        = number
  default     = 2
}

variable "max_count" {
  description = "The maximum number of nodes which should exist in this node pool (required when enable_auto_scaling is true)"
  type        = number
  default     = 10
}

variable "max_pods" {
  description = "The maximum number of pods that can run on each agent"
  type        = number
  default     = 50
}

variable "os_disk_size_gb" {
  description = "The size of the OS Disk in GB"
  type        = number
  default     = 50
}

variable "os_disk_type" {
  description = "The type of disk which should be used for the Operating System (Managed, Ephemeral)"
  type        = string
  default     = "Ephemeral"
}

variable "os_sku" {
  description = "The Operating System SKU to use for this node pool"
  type        = string
  default     = "Ubuntu"
}

variable "os_type" {
  description = "The Operating System which should be used for this node pool (Linux, Windows)"
  type        = string
  default     = "Linux"
}

variable "orchestrator_version" {
  description = "The version of Kubernetes which should be used for this node pool"
  type        = string
  default     = null
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet where the nodes in the node pool should be placed"
  type        = string
  default     = null
}

variable "node_labels" {
  description = "A map of Kubernetes labels to apply to nodes in this node pool"
  type        = map(string)
  default     = {}
}

variable "node_taints" {
  description = "A list of Kubernetes taints to apply to nodes in this node pool"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the node pool"
  type        = map(string)
  default     = {}
}

variable "priority" {
  description = "The priority of the node pool (Regular, Spot)"
  type        = string
  default     = "Regular"
}

variable "eviction_policy" {
  description = "The eviction policy for spot instances (Deallocate, Delete)"
  type        = string
  default     = "Delete"
}

variable "spot_max_price" {
  description = "The maximum price you're willing to pay for spot instances in USD per hour (-1 for on-demand price)"
  type        = number
  default     = -1
}

variable "ultra_ssd_enabled" {
  description = "Should the Ultra SSD be enabled for this node pool"
  type        = bool
  default     = false
}

variable "linux_os_config" {
  description = "Linux OS configuration for the node pool"
  type = object({
    transparent_huge_page_enabled = optional(string, "always")
    sysctl_config = optional(object({
      fs_aio_max_nr               = optional(number, 65536)
      fs_file_max                 = optional(number, 100000)
      fs_inotify_max_user_watches = optional(number, 1000000)
    }))
  })
  default = null
}
