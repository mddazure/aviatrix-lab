# Aviatrix Lab

This is a lab environment to explore Aviatrix on Azure. 
It is deployed through Terraform consists of three parts:
- Controller VNET with Controller and Copilot VMs.
- Two Hub VNETs and eight Spoke VNETs, each with a Windows 2022 Server VM running a basic web server. Bastion is deployed in each Hub and in Spokes 1 and 24.
- Aviatrix Transit and Spoke Gateways in each of the VNETs. Spoke Gateways 1-4 are attached to Transit Gateway 1 and Spokes 21 - 24 to Transit Gateway 2. The Transit Gateways are connected.

![image](images/Aviatrix%20Lab.png)

## Deployment
Log in to Azure Cloud Shell at https://shell.azure.com/ and select Bash.

Ensure Azure CLI and extensions are up to date:
  
`az upgrade --yes`
  
If necessary select your target subscription:
  
`az account set --subscription <Name or ID of subscription>`
  
Clone the  GitHub repository:
`git clone https://github.com/mddazure/aviatrix-lab`

First deploy Controller and Copilot. These are placed in a separate isolated VNET.
Change directory:

 `cd aviatrix-lab/controller`

Open variables.tf in the vi editor:

`vi variables.tf`

Change the variable "incoming_ssl_cidr" to the public ip address the machine you will be accessing the controller with. Save and quit vi with `:wq`.

Initialize Terraform:
`Terraform init`
Apply:
`Terraform apply`
After deployment, copy the Controller public and private ip addresses and the Copilot public ip address from the Terraform output.

Access the Controller from a browser on https://controller-public-ip.
Username: admin
Password: controller private ip address.

Follow instructions in [Azure Account Credential Setup](https://read.docs.aviatrix.com/HowTos/Aviatrix_Account_Azure.html) to create a Service Principal and configure the Controller.






