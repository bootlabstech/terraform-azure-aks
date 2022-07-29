resource "azurerm_kubernetes_cluster" "cluster" {
  name                              = var.cluster_name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  dns_prefix                        = var.dns_prefix
  kubernetes_version                = var.kubernetes_version
  sku_tier                          = var.sku_tier
  automatic_channel_upgrade         = var.automatic_channel_upgrade
  private_cluster_enabled           = var.private_cluster_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  role_based_access_control_enabled = var.enable_role_based_access_control

  default_node_pool {
    name                = var.primary_node_poll_name
    vm_size             = var.vm_size
    os_disk_size_gb     = var.os_disk_size_gb
    os_disk_type        = var.os_disk_type
    enable_auto_scaling = var.enable_auto_scaling
    node_count          = var.primary_node_count
    zones               = var.zones
    min_count           = var.primary_min_count
    max_count           = var.primary_max_count
    max_pods            = var.primary_max_pods
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  network_profile {
    network_plugin     = var.network_plugin
    network_policy     = var.network_policy
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "secondary-pool" {
  name                  = var.secondary-pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.cluster.id
  vm_size               = var.vm_size
  enable_auto_scaling   = var.enable_auto_scaling
  os_disk_size_gb       = var.os_disk_size_gb
  os_disk_type          = var.os_disk_type
  os_type               = var.os_type
  workload_runtime      = var.workload_runtime
  zones                 = var.zones
  node_count            = var.secondary_node_count
  min_count             = var.secondary_min_count
  max_count             = var.secondary_max_count
  max_pods              = var.secondary_max_pods
}
