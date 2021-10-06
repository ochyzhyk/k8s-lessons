resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "ch-aks1"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "ch-cluster1"
  private_cluster_enabled = true

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_B1s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
