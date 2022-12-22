variable "controller-rg-name" {
  type = string
  default = "aviatrix-controller-rg"
}
variable "location-controller" {
  description = "Location to deploy controller"
  type        = string
  //default     = "swedencentral"
default = "West Europe"
}
variable "controller_name" {
    description = "name of Aviatrix controller"
    default = "Controller"
  
}
variable "controller_virtual_machine_admin_username" {
  type        = string
  description = "Admin Username for the controller virtual machine."
  default     = "aviatrix"
}
variable "controller_virtual_machine_admin_password" {
  type        = string
  description = "Admin Password for the controller virtual machine."
  default     = "aviatrix1234!"
}

variable "controller_virtual_machine_size" {
  type        = string
  description = "Virtual Machine size for the controller."
  default     = "Standard_A4_v2"
}
variable "incoming_ssl_cidr" {
  type        = list(string)
  default = [ "217.121.0.0/16" ]
  description = "Incoming cidr for security group used by controller"
}
variable "aad-sp-secret" {
  type = string
  // default = "28V8Q~ti8VdGTf6dkgY.KZHZoOz.q4YRzU6TLdnY" // fdpo
  default = "ghX8Q~DACYuTGz.WCsBeSX2Z~nlkNYBywhd6uajm" //sarosio
  // description = "34e62f82-9e09-4ff6-a809-1c9d1e4f4669" //fdpo
  description = "0bbaeb0f-8f6c-4ddc-b39b-4ca17d73d68e" //sarosio
}
variable "aad-sp-id" {
  type = string
  // default = "6fb7d5be-486e-4aea-b5d9-1d7f3a4cb28f" //fdpo
  default = "a898aff6-e975-4593-ac9a-81415fb501bf" //sarosio
}
variable "directory-id" {
  type = string
  // default = "16b3c013-d300-468d-ac64-7eda0820b6d3" //fdpo
  default = "8da77292-860d-47ba-afd9-bfe774c86c4d" //sarosio
}

variable "copilot_name" {
    description = "name of Aviatrix CoPilot"
    default = "CoPilot"
  
}
