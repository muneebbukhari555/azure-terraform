# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  for_each = var.web_linuxvm_instance_count
  name     = "${local.resource_name_prefix}-${var.web_linuxvm_name}-${each.key}"
  #computer_name = "web-linux-vm" # Hostname of the VM (Optional)
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.web_linuxvm_nic[each.key].id,
  ]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  /*
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "20.04.202209200"
   }*/
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/cloud-init-apache.yaml")
  #custom_data = base64encode(local.webvm_custom_data)
}


