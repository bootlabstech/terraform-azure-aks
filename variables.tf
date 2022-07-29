# cluster
variable "cluster_name" {
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

variable "kubernetes_version" {
  description = "Specify which Kubernetes release to use. The default used is the latest Kubernetes version available in the region"
  type        = string
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid"
  type        = string
}

variable "private_cluster_enabled" {
  description = "If true cluster API server will be exposed only on internal IP address and available only in cluster vnet."
  type        = bool
}

variable "automatic_channel_upgrade" {
  type        = string
  description = "The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable."
}

variable "enable_role_based_access_control" {
  description = "Enable Role Based Access Control."
  type        = bool
}

variable "public_network_access_enabled" {
  type        = bool
  description = "(optional) describe your variable"
}

#service_principal
variable "client_id" {
  description = "The Client ID (appId) for the Service Principal used for the AKS deployment"
  type        = string
}

variable "client_secret" {
  description = "The Client Secret (password) for the Service Principal used for the AKS deployment"
  type        = string
}

#default_node_pool
variable "primary_node_poll_name" {
  type        = string
  description = "The name of node pool"
}

variable "vm_size" {
  type        = string
  description = "VM Size of node pool."
}

variable "os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
}

variable "os_disk_type" {
  description = "The type of disk which should be used for the Operating System. Possible values are `Ephemeral` and `Managed`. Defaults to `Managed`. Changing this forces a new resource to be created."
  type        = string
}

#enable_auto_scaling
variable "enable_auto_scaling" {
  description = "Enable node pool autoscaling"
  type        = bool
}

variable "primary_node_count" {
  type        = number
  description = "Number of nodes in node pool."
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
}

#network_profile
variable "network_plugin" {
  type        = string
  description = "Network plugin to use for networking."
}

variable "service_cidr" {
  type        = string
  description = "The Network Range used by the Kubernetes service."
}

variable "network_policy" {
  type        = string
  description = "Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure."
}

variable "dns_service_ip" {
  type        = string
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns)."
}

variable "docker_bridge_cidr" {
  type        = string
  description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes."
}

# secondary node pool
variable "secondary-pool_name" {
  type        = string
  description = "The name of node pool"
}

variable "os_type" {
  type        = string
  description = "The Operating System which should be used for this Node Pool.values are Linux and Windows. Defaults to Linux."
}

variable "workload_runtime" {
  type        = string
  description = "Used to specify the workload runtime. Allowed values are OCIContainer and WasmWasi."
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
}

variable "secondary_node_count" {
  type        = number
  description = "Number of nodes in node pool."
}

