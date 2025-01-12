resource "azurerm_virtual_network" "tftest_vnet" {
  name                = "tftestvnet"
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = ["192.168.1.0/24"]
  
}

resource "azurerm_subnet" "tftest_subnet" {
    name                 = "tftestsubnet"
    resource_group_name  = var.rg_name
    virtual_network_name = azurerm_virtual_network.tftest_vnet.name
    address_prefixes     = ["192.168.1.128/26"]
  
}

