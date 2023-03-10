variable "name" {
  description = "The name of aks cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name "
  type        = string
}

variable "location" {
  description = "The name of location cluster to be created"
  type        = string
}

variable "vm_size" {
  type        = string
  description = "VM Size of node pool. Example: Standard_D2a_v4"
}

variable "subnet_id" {
  description = "The ID of a Subnet"
  type        = string
}

variable "os_disk_size_gb" {
  description = "Disk size of nodes in GBs. Example: 30"
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

variable "secondary_max_pods" {
  type        = number
  description = "Maximum number of pods in a nodes"
  default     = 30
}
variable "os_sku" {
  type        = string
  description = "disk type in a nodes"
  default     = "Ubuntu"
}

variable "private_cluster_enabled" {
  description = "This will give private endpoint of the aks cluster"
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "This will give public endpoint of the aks cluster"
  default     = false
}

variable "default_node_count" {
  type        = number
  description = "The number of node to be run in default node pool"
}
variable "sku_tier" {
  type        = number
  description = "The tier of the cluster"
}
