resource "azurerm_kubernetes_cluster" "cluster" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  dns_prefix                    = var.dns_prefix
  private_cluster_enabled       = true
  public_network_access_enabled = false

  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size             = var.vm_size
    vnet_subnet_id      = var.subnet_id
    os_disk_size_gb     = var.os_disk_size_gb
    zones               = var.zones
    enable_auto_scaling = true
    min_count           = var.primary_min_count
    max_count           = var.primary_max_count
    max_pods            = var.primary_max_pods
  }

  network_profile {
    network_plugin     = "azure"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks-identity.id]
  }
  
  depends_on = [
    azurerm_role_assignment.Contributor-role-assignment,
  ]

}


resource "azurerm_kubernetes_cluster_node_pool" "secondary-pool" {
  name                  = "secondary"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.cluster.id
  vm_size               = var.vm_size
  enable_auto_scaling   = true
  os_disk_size_gb       = var.os_disk_size_gb
  workload_runtime      = "OCIContainer"
  zones                 = var.zones
  node_count            = 1
  min_count             = var.secondary_min_count
  max_count             = var.secondary_max_count
  max_pods              = var.secondary_max_pods
}



resource "azurerm_user_assigned_identity" "aks-identity" {
  name                = "aks_identity"
  resource_group_name = data.azurerm_resource_group.application-resource-group.name
  location            = var.location
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

data "azurerm_resource_group" "application-resource-group" {
  name = var.resource_group_name
}

resource "azurerm_role_assignment" "Contributor-role-assignment" {
  scope                = data.azurerm_resource_group.application-resource-group.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.aks-identity.principal_id
  depends_on = [
    azurerm_user_assigned_identity.aks-identity
  ]
}

