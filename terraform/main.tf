provider "azurerm" {
    features {}
    skip_provider_registration = true
} 

terraform {
  backend "azurerm"{
    resource_group_name = "RG-terraform"
    storage_account_name = "chtfstorage"
    container_name = "tfstates"
    key = "prod/k8s.tfstate"
  }
}