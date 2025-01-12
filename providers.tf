terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
    features {}
  # Configuration options
    subscription_id = "b2b1a439-1ecd-424a-8646-fe44b9e39ff8"
    tenant_id = "ec3d4e50-d8eb-473f-b900-b9845c026cad"
}
