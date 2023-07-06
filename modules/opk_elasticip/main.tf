terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}

resource "openstack_networking_floatingip_v2" "floatip" {
  pool = "public1"
}


resource "openstack_compute_floatingip_associate_v2" "myip" {
  floating_ip = openstack_networking_floatingip_v2.floatip.address
  instance_id = var.elastic_compute
  fixed_ip    =  var.elastic_compute_ip
}

