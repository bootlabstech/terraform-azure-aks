resource "azurerm_kubernetes_cluster" "cluster" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  dns_prefix                    = var.dns_prefix
  private_cluster_enabled       = true
  public_network_access_enabled = false

  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    vm_size             = var.vm_size
    vnet_subnet_id      = var.subnet_id
    os_disk_size_gb     = var.os_disk_size_gb
    zones               = var.zones
    enable_auto_scaling = true
    min_count           = var.primary_min_count
    max_count           = var.primary_max_count
    max_pods            = var.primary_max_pods
    os_sku              = var.os_sku
  }

  network_profile {
    network_plugin = "azure"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks-identity.id]
  }

  depends_on = [
    azurerm_role_assignment.Contributor-role-assignment,
  ]
    key_vault_secrets_provider {
    
    secret_rotation_enabled = true

  }

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
  os_sku                = var.os_sku
  vnet_subnet_id        = var.vnet_subnet_id
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

# resource "azurerm_kubernetes_cluster" "aks-cluster" {
#   name                          = var.name
#   location                      = var.location
#   resource_group_name           = var.resource_group_name
#   dns_prefix                    = var.name
#   private_cluster_enabled       = var.private_cluster_enabled
#   public_network_access_enabled = var.public_network_access_enabled
#   sku_tier                      = var.sku_tier 
#   automatic_channel_upgrade =   var.automatic_channel_upgrade
  

#   default_node_pool {
#     name                = "default"
#     node_count          = var.default_node_count
#     vm_size             = var.vm_size
#     vnet_subnet_id      = var.subnet_id
#     os_disk_size_gb     = var.os_disk_size_gb
#     zones               = var.zones
#     enable_auto_scaling = true
#     min_count           = var.primary_min_count
#     max_count           = var.primary_max_count
#     max_pods            = var.primary_max_pods
#     os_sku              = var.os_sku
#   }

#   network_profile {
#     network_plugin = "azure"
#     service_cidr                  = var.service_cidr
#     dns_service_ip                = var.dns_service_ip 
#     docker_bridge_cidr            = var.docker_bridge_cidr
#   }

#   identity {
#     type         = "UserAssigned"
#     identity_ids = [azurerm_user_assigned_identity.aks-identity.id]
#   }

#   depends_on = [
#     azurerm_role_assignment.Contributor-role-assignment,
#   ]
#   lifecycle {
#     ignore_changes = [
#       tags,
#     ]
#   }

#   key_vault_secrets_provider {
    
#     secret_rotation_enabled = true

#   }

# }

# resource "azurerm_user_assigned_identity" "aks-identity" {
#   name                = "${var.name}-aks_identity"
#   resource_group_name = data.azurerm_resource_group.application-resource-group.name
#   location            = var.location
#   lifecycle {
#     ignore_changes = [
#       tags,
#     ]
#   }
# }

# data "azurerm_resource_group" "application-resource-group" {
#   name = var.resource_group_name
# }

# resource "azurerm_role_assignment" "Contributor-role-assignment" {
#   scope                = data.azurerm_resource_group.application-resource-group.id
#   role_definition_name = "Contributor"
#   principal_id         = azurerm_user_assigned_identity.aks-identity.principal_id
#   depends_on = [
#     azurerm_user_assigned_identity.aks-identity
#   ]
# }