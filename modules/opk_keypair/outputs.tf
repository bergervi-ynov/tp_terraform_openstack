output "keypair_name" {
  value = openstack_compute_keypair_v2.my-keypair.name
}

output "keypair_private" {
  value = openstack_compute_keypair_v2.my-keypair.private_key
}

output "keypair_public" {
  value = openstack_compute_keypair_v2.my-keypair.public_key
}