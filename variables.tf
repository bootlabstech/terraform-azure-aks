variable "name" {
  description = "The name of the Managed Kubernetes Cluster to create."
  type        = string
}
variable "location" {
  description = "The location where the Managed Kubernetes Cluster should be created."
  type        = string
}
variable "resource_group_name" {
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist."
  type        = string
}
variable "private_cluster_enabled" {
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false."
  type        = bool
  default     = true
}
variable "public_network_access_enabled" {
  type        = bool
  description = " Whether public network access is allowed for this Kubernetes Cluster. Defaults to true.r"
  default     = false
}
variable "sku_tier" {
  type        = string
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, and Standard (which includes the Uptime SLA). Defaults to Free."
}
variable "automatic_channel_upgrade" {
  type        = string
  description = "The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none."
  default     = "stable"
}
variable "default_node_count" {
  type        = number
  description = "The initial number of nodes which should exist in the default Node Pool. If specified this must be between 1 and 1000 and between min_count and max_count."
}
variable "vm_size" {
  type        = string
  description = "The size of the Virtual Machine, such as Standard_DS2_v2. temporary_name_for_rotation must be specified when attempting a resize.Refer documentation for all options"
}
variable "vnet_subnet_id" {
  description = "The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "os_disk_size_gb" {
  description = "The size of the OS Disk which should be used for each agent in the Node Pool. temporary_name_for_rotation must be specified when attempting a change"
  type        = number
}
variable "zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this Kubernetes Cluster should be located. "
  default     = ["1"]
}
variable "enable_auto_scaling" {
  type        = bool
  description = " is set to true when these variables are set some value primary max_count, min_count, node_count"
}
variable "primary_min_count" {
  type        = number
  description = "The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
}
variable "primary_max_count" {
  type        = number
  description = "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
}
variable "primary_max_pods" {
  type        = number
  description = "Maximum number of pods in a nodes"
  default     = 30
}
variable "os_sku" {
  type        = string
  description = "Specifies the OS SKU used by the agent pool. Possible values include: AzureLinux, Ubuntu, Windows2019, Windows2022. If not specified, the default is Ubuntu if OSType=Linux or Windows2019 if OSType=Windows. And the default Windows OSSKU will be changed to Windows2022 after Windows2019 is deprecated. temporary_name_for_rotation must be specified when attempting a change."
  default     = "Ubuntu"
}
variable "network_plugin" {
  description = "The ID of a Subnet"
  type        = string
  default     = "azure"
}

