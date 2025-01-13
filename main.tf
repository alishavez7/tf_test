resource "azurerm_resource_group" "tftest_rg" {
  name = "rg"
  location = "westeurope"
}

resource "azurerm_storage_account" "tftest_sa" {
  name                     = "tftestsatf"
  resource_group_name      = azurerm_resource_group.tftest_rg.name
  location                 = azurerm_resource_group.tftest_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

module "Vnet_Module" {
  source = "./Modules/Vnet_Module"
    rg_name = azurerm_resource_group.tftest_rg.name
  
}

module "VM_Module" {
  source = "./Modules/VM_Module"
    rg_name = azurerm_resource_group.tftest_rg.name
    subnet_id = module.Vnet_Module.subnet_id  
}
