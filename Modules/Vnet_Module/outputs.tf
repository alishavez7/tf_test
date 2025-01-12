output "Vnet_id" {
  value = azurerm_virtual_network.tftest_vnet.id
  
}

output "subnet_id" {
  value = azurerm_subnet.tftest_subnet.id
  
}