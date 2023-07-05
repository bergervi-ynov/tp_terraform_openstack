resource "openstack_compute_instance_v2" "ubuntu_instance" {
  name            = var.compute_name
  image_id        = var.compute_image_id
  flavor_id       = var.compute_flavor_id
  key_pair        = var.compute_key_pair
  security_groups = var.compute_secgroup

  metadata = {
    this = "Ubuntu"
  }

  network {
    name = var.compute_network_name
  }
}