# cluster
variable "name" {
  description = "The cluster name for the AKS resources created in the specified Azure Resource Group."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name to be imported"
  type        = string
}

variable "location" {
  description = "The Azure region in which all resources in this example should be provisioned."
  type        = string
}

variable "dns_prefix" {
  description = "(The prefix for the resources created in the specified Azure Resource Group"
  type        = string
}

variable "private_cluster_enabled" {
  description = "Should enabled private cluster"
  type = bool
  default = false
}


# default_node_pool

variable "vm_size" {
  type        = string
  description = "VM Size of node pool."
}

variable "subnet_id" {
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
}

variable "zones" {
  type        = list(string)
  description = "A list of Availability Zones across which the Node Pool should be spread."
}

variable "primary_min_count" {
  type        = number
  description = "Minimum number of nodes in a pool"
}

variable "primary_max_count" {
  type        = number
  description = "Maximum number of nodes in a pool"
}

variable "primary_max_pods" {
  type        = number
  description = "Maximum number of pods in a nodes"
  default     = 30
}

variable "secondary_min_count" {
  type        = number
  description = "Minimum number of nodes in a pool"
}

variable "secondary_max_count" {
  type        = number
  description = "Maximum number of nodes in a pool"
}

variable "secondary_max_pods" {
  type        = number
  description = "Maximum number of pods in a nodes"
  default     = 30
}
variable "os_sku" {
  type        = string
  description = "disk type in a nodes"
}