resource "aviatrix_segmentation_network_domain_connection_policy" "segmentation_network_domain_connection_policy_1" {
    domain_name_1 = "blue"
    domain_name_2 = "green"
}

resource "aviatrix_segmentation_network_domain_connection_policy" "segmentation_network_domain_connection_policy_2" {
    domain_name_1 = "blue"
    domain_name_2 = "red"
}

resource "aviatrix_segmentation_network_domain_connection_policy" "segmentation_network_domain_connection_policy_3" {
    domain_name_1 = "green"
    domain_name_2 = "red"
}

