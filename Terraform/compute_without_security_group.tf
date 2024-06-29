resource "azurerm_network_interface" "nic" {

  name                = "david-book-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name


  ip_configuration {
    name                          = "david-book-ip-config"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}


resource "azurerm_public_ip" "pip" {
  name                = "david-book-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  domain_name_label   = "bookdevopsdavidtch"
} 

resource "azurerm_storage_account" "stor" {
  name = "davidbookstor"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  account_tier = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_virtual_machine" "vm" {
  name                  = "david-book-vm"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "david-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }


  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "david-vm"
    admin_username = "adminuser"
    admin_password = "Admin&1"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

}


