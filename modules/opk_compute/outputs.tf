output "compute_id" {
  value = openstack_compute_instance_v2.ubuntu_instance.id
}

output "compute_ip_id" {
  value = openstack_compute_instance_v2.ubuntu_instance.network.0.fixed_ip_v4
}