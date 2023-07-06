output "compute_id" {
  value = ubuntu_instance.id
}

output "compute_ip_id" {
  value = ubuntu_instance.network.1.fixed_ip_v4
}