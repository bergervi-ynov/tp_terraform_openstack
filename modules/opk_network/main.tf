terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}
resource "openstack_networking_network_v2" "vm_network" {
  name            = "terraform_network"
  admin_state_up  = true
}

resource "openstack_networking_subnet_v2" "vm_subnet" {
  name            = "terraform-subnet"
  network_id      = openstack_networking_network_v2.vm_network.id
  cidr            = "192.168.1.0/24"
  ip_version      = 4
  enable_dhcp = true
  gateway_ip      = "192.168.1.1"
  allocation_pool {
    start = "192.168.1.100"
    end   = "192.168.1.200"
  }
  
}