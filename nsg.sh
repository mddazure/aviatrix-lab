for ((;;))
do
    echo "removing nsg"
    az network vnet subnet update -g aviatrix-hub-rg --vnet-name hub-1-vnet --name aviatrixControllerSubnet --network-security-group ""
    az network vnet subnet update -g aviatrix-hub-rg --vnet-name hub-1-vnet --name aviatrixGWSubnet --network-security-group ""
    az network vnet subnet update -g aviatrix-spoke-rg --vnet-name spoke-1-vnet --name aviatrixSubnet --network-security-group ""
    az network vnet subnet update -g aviatrix-spoke-rg --vnet-name spoke-1-vnet --name vmSubnet --network-security-group ""
    az network vnet subnet update -g aviatrix-spoke-rg --vnet-name spoke-2-vnet --name aviatrixSubnet --network-security-group ""
    az network vnet subnet update -g aviatrix-spoke-rg --vnet-name spoke-2-vnet --name vmSubnet --network-security-group ""
    az network vnet subnet update -g aviatrix-spoke-rg --vnet-name spoke-3-vnet --name aviatrixSubnet --network-security-group ""
    az network vnet subnet update -g aviatrix-spoke-rg --vnet-name spoke-3-vnet --name vmSubnet --network-security-group ""
    az network vnet subnet update -g aviatrix-spoke-rg --vnet-name spoke-4-vnet --name aviatrixSubnet --network-security-group ""
    az network vnet subnet update -g aviatrix-spoke-rg --vnet-name spoke-4-vnet --name vmSubnet --network-security-group ""
    echo "waiting 60 seconds"
    sleep 60
done


