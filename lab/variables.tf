variable "hub-rg-name" {
  type = string
  default = "aviatrix-hub-rg"
  }
variable "spoke-rg-name" {
  type = string
  default = "aviatrix-spoke-rg"
}
variable "location-hub" {
  description = "Location to deploy hub"
  type        = string
  //default     = "swedencentral"
default = "West Europe"
}
variable "location-spoke-1" {
  description = "Location to deploy spoke-1"
  type        = string
  //default     = "swedencentral"
default = "West Europe"
}
variable "location-spoke-2" {
  description = "Location to deploy spoke-2"
  type        = string
  //default     = "swedencentral"
default = "westeurope"
}
variable "location-spoke-3" {
  description = "Location to deploy spoke-3"
  type        = string
  //default     = "swedencentral"
default = "westeurope"
}
variable "location-spoke-4" {
  description = "Location to deploy spoke-4"
  type        = string
  //default     = "swedencentral"
default = "westeurope"
}
variable "username" {
  description = "Username for Virtual Machines"
  type        = string
  default     = "AzureAdmin"
}
variable "password" {
  description = "Virtual Machine password, must meet Azure complexity requirements"
   type        = string
   default     = "Aviatrix-2022"
}
variable "vmsize" {
  description = "Size of the VMs"
  default     = "Standard_D2s_v3"
}
variable "controller-ip" {
  description   = "public ip of controller"
  default       = "52.174.104.106"
}
variable "copilot-ip" {
  description   = "public ip of copilot"
  default       = "52.174.104.99"
}
variable "controller_admin_username" {
  type        = string
  description = "Admin Username for the controller."
  default     = "admin"
}
variable "controller_admin_password" {
  type        = string
  description = "Admin Password for the controller."
  default     = "Nienke0405%"
}