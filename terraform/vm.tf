# Creamos la máquina virtual

resource "azurerm_linux_virtual_machine" "myVM1" {
  name                              = var.vm_name
  resource_group_name               = azurerm_resource_group.rg.name
  location                          = azurerm_resource_group.rg.location
  size                              = var.vm_size
  admin_username                    = "adminUsername"
  network_interface_ids             = [azurerm_network_interface.myNicl.id]
  disable_password_authentication   = true

  admin_ssh_key {
    username   = "adminUsername"
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
  }

  tags = {
    environment = "casopractico2"
  }
}