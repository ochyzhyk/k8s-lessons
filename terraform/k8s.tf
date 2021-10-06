resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "ch-aks1"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "ch-cluster1"
  private_cluster_enabled = false

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

# add the role to the identity the kubernetes cluster was assigned
resource "azurerm_role_assignment" "kubweb_to_acr" {
  scope                = "/subscriptions/140114da-9364-44dc-b985-edb523bc07b3/resourceGroups/RG-terraform/providers/Microsoft.ContainerRegistry/registries/chyregistry"
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
}
