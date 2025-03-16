resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "cpract2aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.aks_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "casopractico2"
  }
}

# Damos permisos de descarga desde el ACR

resource "azurerm_role_assignment" "ra-perm" {
  principal_id          = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name  = "AcrPull"
  scope                 = azurerm_container_registry.acr.id
}