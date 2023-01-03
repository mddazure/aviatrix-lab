resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_1" {
    transit_gateway_name = "transit-gw-hub-2"
    network_domain_name = "blue"
    attachment_name = "spoke-gw-21"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_2" {
    transit_gateway_name = "transit-gw-hub-1"
    network_domain_name = "blue"
    attachment_name = "spoke-gw-2"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_3" {
    transit_gateway_name = "transit-gw-hub-2"
    network_domain_name = "red"
    attachment_name = "spoke-gw-24"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_4" {
    transit_gateway_name = "transit-gw-hub-1"
    network_domain_name = "red"
    attachment_name = "spoke-gw-1"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_5" {
    transit_gateway_name = "transit-gw-hub-1"
    network_domain_name = "red"
    attachment_name = "spoke-gw-4"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_6" {
    transit_gateway_name = "transit-gw-hub-2"
    network_domain_name = "green"
    attachment_name = "spoke-gw-23"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_7" {
    transit_gateway_name = "transit-gw-hub-2"
    network_domain_name = "green"
    attachment_name = "spoke-gw-22"
}

resource "aviatrix_segmentation_network_domain_association" "segmentation_network_domain_association_8" {
    transit_gateway_name = "transit-gw-hub-1"
    network_domain_name = "green"
    attachment_name = "spoke-gw-3"
}

