resource "azurerm_network_interface" "tftest_nic" {
    name                      = "tftestvm_nic"
    location                  = var.location
    resource_group_name       = var.rg_name
    //network_security_group_id = azurerm_network_security_group.tftest_nsg.id
    
    ip_configuration {
        name                          = "testconfiguration1"
        subnet_id                     = var.subnet_id
        private_ip_address_allocation = "Dynamic"
    }
  
}

resource "azurerm_virtual_machine" "tftest_vmname" {
    name                  = "tftestvm"
    location              = var.location
    resource_group_name   = var.rg_name
    network_interface_ids = [azurerm_network_interface.tftest_nic.id]
    vm_size               = "Standard_DS1_v2"
    
    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04-LTS"
        version   = "latest"
    }
    
    storage_os_disk {
        name              = "tftestvm_osdisk1"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }
    
    os_profile {
        computer_name  = "tftestvm"
        admin_username = "testadmin"
        admin_password = "Password1234!"
    }
    
    os_profile_linux_config {
        disable_password_authentication = false
    }
  
}

variable "subnet_id" {
    description = "The ID of the subnet to which the NIC is attached"
    type        = string
  
}



