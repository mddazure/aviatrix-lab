output "controller-ip" {
    value = azurerm_public_ip.aviatrix_controller_public_ip.ip_address
}