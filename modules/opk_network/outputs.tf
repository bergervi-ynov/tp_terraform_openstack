output "network" {
  value = openstack_networking_network_v2.vm_network
}

output "subnet" {
  value = openstack_networking_subnet_v2.vm_subnet
}