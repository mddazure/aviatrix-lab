############################## change to actual ip address of your internet connection #############
variable "incoming_ssl_cidr" {
  type        = list(string)
  default = [ "217.121.0.0/16" ]
  description = "Incoming cidr for security group used by controller"
}
####################################################################################################

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
  default     = "Standard_D2s_v5"
}
variable "aad-sp-secret" {
  type = string
  // default = "28V8Q~ti8VdGTf6dkgY.KZHZoOz.q4YRzU6TLdnY" // fdpo
  // default = "ghX8Q~DACYuTGz.WCsBeSX2Z~nlkNYBywhd6uajm" //sarosio
  // description = "34e62f82-9e09-4ff6-a809-1c9d1e4f4669" //fdpo
  // description = "0bbaeb0f-8f6c-4ddc-b39b-4ca17d73d68e" //sarosio
  default =  "7vI8Q~s.HrwMnKLbXxoFisWQKGX3VY_Sdc3JLbsP" // dedroog.net
  description = "5a85a8d5-f703-4c69-b2a1-f2b7142a7823"
}
variable "aad-sp-id" {
  type = string
  // default = "6fb7d5be-486e-4aea-b5d9-1d7f3a4cb28f" //fdpo
  // default = "a898aff6-e975-4593-ac9a-81415fb501bf" //sarosio
   default = "a1411a79-e8f1-4a7f-9bfe-bc83dce030b0"// dedroog.net
}
variable "directory-id" {
  type = string
  // default = "16b3c013-d300-468d-ac64-7eda0820b6d3" //fdpo
  // default = "8da77292-860d-47ba-afd9-bfe774c86c4d" //sarosio
  default = "5cc7c0ac-2f0f-4bc9-8aa7-673c5b98eda4"// dedroog.net
}

variable "copilot_name" {
    description = "name of Aviatrix CoPilot"
    default = "CoPilot"
  
}
variable "subscription_id" {
  // default = "d44aae72-864b-4efe-a856-28c4336b52d1" //fdpo
  //description = "MdD_1_non_prod"
  default = "7749fbb8-4096-4e85-8ad2-ef8182d01f02"
  description = "External_MdD_1"
}
