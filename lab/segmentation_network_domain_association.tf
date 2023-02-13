resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_1" {
    depends_on = [
      aviatrix_transit_gateway.transit_gw_2,
      aviatrix_spoke_gateway.spoke_21_gw
    ]
    transit_gateway_name = "transit-gw-hub-2"
    network_domain_name = "blue"
    attachment_name = "spoke-gw-21"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_2" {
    depends_on = [
      aviatrix_transit_gateway.transit_gw,
      aviatrix_spoke_gateway.spoke_2_gw
    ]
    transit_gateway_name = "transit-gw-hub-1"
    network_domain_name = "blue"
    attachment_name = "spoke-gw-2"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_3" {
    depends_on = [
      aviatrix_transit_gateway.transit_gw_2,
      aviatrix_spoke_gateway.spoke_24_gw
    ]
    transit_gateway_name = "transit-gw-hub-2"
    network_domain_name = "red"
    attachment_name = "spoke-gw-24"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_4" {
    depends_on = [
      aviatrix_transit_gateway.transit_gw,
      aviatrix_spoke_gateway.spoke_1_gw
    ]
    transit_gateway_name = "transit-gw-hub-1"
    network_domain_name = "red"
    attachment_name = "spoke-gw-1"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_5" {
    depends_on = [
      aviatrix_transit_gateway.transit_gw,
      aviatrix_spoke_gateway.spoke_4_gw
    ]
    transit_gateway_name = "transit-gw-hub-1"
    network_domain_name = "red"
    attachment_name = "spoke-gw-4"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_6" {
    depends_on = [
      aviatrix_transit_gateway.transit_gw_2,
      aviatrix_spoke_gateway.spoke_23_gw
    ]
    transit_gateway_name = "transit-gw-hub-2"
    network_domain_name = "green"
    attachment_name = "spoke-gw-23"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_7" {
    depends_on = [
      aviatrix_transit_gateway.transit_gw_2,
      aviatrix_spoke_gateway.spoke_22_gw
    ]
    transit_gateway_name = "transit-gw-hub-2"
    network_domain_name = "green"
    attachment_name = "spoke-gw-22"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_8" {
    depends_on = [
      aviatrix_transit_gateway.transit_gw,
      aviatrix_spoke_gateway.spoke_3_gw
    ]
    transit_gateway_name = "transit-gw-hub-1"
    network_domain_name = "green"
    attachment_name = "spoke-gw-3"
}

