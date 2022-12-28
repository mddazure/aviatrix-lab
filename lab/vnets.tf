#######################################################################
## Create Virtual Network - Hub 1
#######################################################################
resource "azurerm_virtual_network" "hub-1-vnet" {
  name                = "hub-1-vnet"
  location            = var.location-hub
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "hub"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = "true"
  }
}
#######################################################################
## Create Subnets - Hub 1
#######################################################################
resource "azurerm_subnet" "hub-1-aviatrix-gateway-subnet" {
  name                 = "aviatrixGWSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  virtual_network_name = azurerm_virtual_network.hub-1-vnet.name
  address_prefixes       = ["10.0.0.0/24"]
}
resource "azurerm_subnet" "hub-1-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  virtual_network_name = azurerm_virtual_network.hub-1-vnet.name
  address_prefixes       = ["10.0.1.0/24"]
}
resource "azurerm_subnet" "bastion-hub-1-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  virtual_network_name = azurerm_virtual_network.hub-1-vnet.name
  address_prefixes       = ["10.0.2.0/24"]
}
#######################################################################
## Create Virtual Network - Spoke 1
#######################################################################
resource "azurerm_virtual_network" "spoke-1-vnet" {
  name                = "spoke-1-vnet"
  location            = var.location-spoke-1
  resource_group_name = azurerm_resource_group.aviatrix-spoke-rg.name
  address_space       = ["10.1.0.0/16"]

  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = "true"
  }
}
#######################################################################
## Create Subnets - Spoke 1
#######################################################################
resource "azurerm_subnet" "spoke-1-aviatrix-subnet" {
  name                 = "aviatrixSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-1-vnet.name
  address_prefixes       = ["10.1.0.0/24"]
}
resource "azurerm_subnet" "spoke-1-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-1-vnet.name
  address_prefixes       = ["10.1.1.0/24"]
}
resource "azurerm_subnet" "bastion-spoke-1-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-1-vnet.name
  address_prefixes       = ["10.1.2.0/24"]
}
#######################################################################
## Create Virtual Network - Spoke 2
#######################################################################
resource "azurerm_virtual_network" "spoke-2-vnet" {
  name                = "spoke-2-vnet"
  location            = var.location-spoke-2
  resource_group_name = azurerm_resource_group.aviatrix-spoke-rg.name
  address_space       = ["10.2.0.0/16"]

  tags = {
    environment = "spoke-2"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = "true"
  }
}
#######################################################################
## Create Subnets - Spoke 2
#######################################################################
resource "azurerm_subnet" "spoke-2-aviatrix-subnet" {
  name                 = "aviatrixSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-2-vnet.name
  address_prefixes       = ["10.2.0.0/24"]
}
resource "azurerm_subnet" "spoke-2-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-2-vnet.name
  address_prefixes       = ["10.2.1.0/24"]
}
resource "azurerm_subnet" "bastion-spoke-2-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-2-vnet.name
  address_prefixes       = ["10.2.2.0/24"]
}
#######################################################################
## Create Virtual Network - Spoke 3
#######################################################################
resource "azurerm_virtual_network" "spoke-3-vnet" {
  name                = "spoke-3-vnet"
  location            = var.location-spoke-3
  resource_group_name = azurerm_resource_group.aviatrix-spoke-rg.name
  address_space       = ["10.3.0.0/16"]

  tags = {
    environment = "spoke-3"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = "true"
  }
}
#######################################################################
## Create Subnets - Spoke 3
#######################################################################
resource "azurerm_subnet" "spoke-3-aviatrix-subnet" {
  name                 = "aviatrixSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-3-vnet.name
  address_prefixes       = ["10.3.0.0/24"]
}
resource "azurerm_subnet" "spoke-3-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-3-vnet.name
  address_prefixes       = ["10.3.1.0/24"]
}
resource "azurerm_subnet" "bastion-spoke-3-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-3-vnet.name
  address_prefixes       = ["10.3.2.0/24"]
}
#######################################################################
## Create Virtual Network - Spoke 4
#######################################################################
resource "azurerm_virtual_network" "spoke-4-vnet" {
  name                = "spoke-4-vnet"
  location            = var.location-spoke-4
  resource_group_name = azurerm_resource_group.aviatrix-spoke-rg.name
  address_space       = ["10.4.0.0/16"]

  tags = {
    environment = "spoke-4"
    deployment  = "terraform"
    lab         = "aviatrix"
    NRMSBreakGlass = "true"
  }
}
#######################################################################
## Create Subnets - Spoke 4
#######################################################################
resource "azurerm_subnet" "spoke-4-aviatrix-subnet" {
  name                 = "aviatrixSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-4-vnet.name
  address_prefixes       = ["10.4.0.0/24"]
}
resource "azurerm_subnet" "spoke-4-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-4-vnet.name
  address_prefixes       = ["10.4.1.0/24"]
}
resource "azurerm_subnet" "bastion-spoke-4-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-4-vnet.name
  address_prefixes       = ["10.4.2.0/24"]
}

#######################################################################
## Create Network Interface - Hub 1
#######################################################################
resource "azurerm_network_interface" "hub-1-nic" {
  name                 = "hub-1-nic"
  location             = var.location-hub
  resource_group_name  = azurerm_resource_group.aviatrix-hub-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "hub-1-ipconfig"
    subnet_id                     = azurerm_subnet.hub-1-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "hub"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Network Interface - Spoke 1
#######################################################################
resource "azurerm_network_interface" "spoke-1-nic" {
  name                 = "spoke-1-nic"
  location             = var.location-spoke-1
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-1-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-1-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Network Interface - Spoke 2
#######################################################################
resource "azurerm_network_interface" "spoke-2-nic" {
  name                 = "spoke-12-nic"
  location             = var.location-spoke-2
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-2-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-2-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-2"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Network Interface - Spoke 3
#######################################################################
resource "azurerm_network_interface" "spoke-3-nic" {
  name                 = "spoke-3-nic"
  location             = var.location-spoke-3
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-3-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-3-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-3"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Network Interface - Spoke 4
#######################################################################
resource "azurerm_network_interface" "spoke-4-nic" {
  name                 = "spoke-4-nic"
  location             = var.location-spoke-4
  resource_group_name  = azurerm_resource_group.aviatrix-spoke-rg.name
  enable_ip_forwarding = false

  ip_configuration {
    name                          = "spoke-4-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-4-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "spoke-4"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
#######################################################################
## Create Virtual Machine hub-1
#######################################################################
resource "azurerm_windows_virtual_machine" "hub-1-vm" {
  name                  = "hub-1-vm"
  location              = var.location-hub
  resource_group_name   = azurerm_resource_group.aviatrix-hub-rg.name
  network_interface_ids = [azurerm_network_interface.hub-1-nic.id]
  size               = var.vmsize
  computer_name  = "hub-1-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true

  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  os_disk {
    name              = "hub-1-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "hub"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_virtual_machine_extension" "install-iis-hub-1-vm" {
    
  name                 = "install-iis-hub-1-vm"
  virtual_machine_id   = azurerm_windows_virtual_machine.hub-1-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

   settings = <<SETTINGS
    {
        "commandToExecute":"powershell -ExecutionPolicy Unrestricted Add-WindowsFeature Web-Server; powershell -ExecutionPolicy Unrestricted Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"
    }
SETTINGS
}
#######################################################################
## Create Virtual Machine spoke-1
#######################################################################
resource "azurerm_windows_virtual_machine" "spoke-1-vm" {
  name                  = "spoke-1-vm"
  location              = var.location-spoke-1
  resource_group_name   = azurerm_resource_group.aviatrix-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-1-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-1-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true

  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  os_disk {
    name              = "spoke-1-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_virtual_machine_extension" "install-iis-spoke-1-vm" {
    
  name                 = "install-iis-spoke-1-vm"
  virtual_machine_id   = azurerm_windows_virtual_machine.spoke-1-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

   settings = <<SETTINGS
    {
        "commandToExecute":"powershell -ExecutionPolicy Unrestricted Add-WindowsFeature Web-Server; powershell -ExecutionPolicy Unrestricted Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername);powershell -ExecutionPolicy Unrestricted Invoke-WebRequest -Uri https://raw.githubusercontent.com/mddazure/aviatrix-lab/main/lab/loop.bat -OutFile C:\Users\AzureAdmin\Desktop\loop.bat"
    }
SETTINGS
}
#######################################################################
## Create Virtual Machine spoke-2
#######################################################################
resource "azurerm_windows_virtual_machine" "spoke-2-vm" {
  name                  = "spoke-2-vm"
  location              = var.location-spoke-2
  resource_group_name   = azurerm_resource_group.aviatrix-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-2-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-2-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true

  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  os_disk {
    name              = "spoke-2-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "spoke-2"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_virtual_machine_extension" "install-iis-spoke-2-vm" {
    
  name                 = "install-iis-spoke-2-vm"
  virtual_machine_id   = azurerm_windows_virtual_machine.spoke-2-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

   settings = <<SETTINGS
    {
        "commandToExecute":"powershell -ExecutionPolicy Unrestricted Add-WindowsFeature Web-Server; powershell -ExecutionPolicy Unrestricted Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"
    }
SETTINGS
}
#######################################################################
## Create Virtual Machine spoke-3
#######################################################################
resource "azurerm_windows_virtual_machine" "spoke-3-vm" {
  name                  = "spoke-3-vm"
  location              = var.location-spoke-3
  resource_group_name   = azurerm_resource_group.aviatrix-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-3-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-3-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true

  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  os_disk {
    name              = "spoke-3-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "spoke-3"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_virtual_machine_extension" "install-iis-spoke-3-vm" {
    
  name                 = "install-iis-spoke-3-vm"
  virtual_machine_id   = azurerm_windows_virtual_machine.spoke-3-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

   settings = <<SETTINGS
    {
        "commandToExecute":"powershell -ExecutionPolicy Unrestricted Add-WindowsFeature Web-Server; powershell -ExecutionPolicy Unrestricted Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"
    }
SETTINGS
}
#######################################################################
## Create Virtual Machine spoke-4
#######################################################################
resource "azurerm_windows_virtual_machine" "spoke-4-vm" {
  name                  = "spoke-4-vm"
  location              = var.location-spoke-4
  resource_group_name   = azurerm_resource_group.aviatrix-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-4-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-4-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true

  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  os_disk {
    name              = "spoke-4-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  
  tags = {
    environment = "spoke-4"
    deployment  = "terraform"
    lab         = "aviatrix"
  }
}
resource "azurerm_virtual_machine_extension" "install-iis-spoke-4-vm" {
    
  name                 = "install-iis-spoke-4-vm"
  virtual_machine_id   = azurerm_windows_virtual_machine.spoke-4-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

   settings = <<SETTINGS
    {
        "commandToExecute":"powershell -ExecutionPolicy Unrestricted Add-WindowsFeature Web-Server; powershell -ExecutionPolicy Unrestricted Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"
    }
SETTINGS
}
