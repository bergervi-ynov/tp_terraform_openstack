resource "openstack_networking_router_v2" "router" {
  name          = "terraform_router"
  admin_state_up = true
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id    = openstack_networking_router_v2.router.id
  subnet_id    = var.private_subnet_id
}

resource "openstack_networking_router_gateway_v2" "router_gateway" {
  router_id      = openstack_networking_router_v2.router.id
  network_id     = "9cd4fa81-8616-4a2d-af0f-a910890b7e52"
  enable_snat    = true
}