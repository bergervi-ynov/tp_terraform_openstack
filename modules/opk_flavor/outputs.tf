output "ubuntu_flavor_object" {
  value = openstack_compute_flavor_v2.ubuntu_flavor
  description = "The ubuntu flavor name"
}