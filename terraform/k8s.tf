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
