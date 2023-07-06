terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}
resource "openstack_networking_router_v2" "router" {
  name          = "terraform_router"
  admin_state_up = true
  external_network_id = "9cd4fa81-8616-4a2d-af0f-a910890b7e52"
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id    = openstack_networking_router_v2.router.id
  subnet_id    = var.private_subnet_id
}
