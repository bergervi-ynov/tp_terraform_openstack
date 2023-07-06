terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}
resource "openstack_compute_keypair_v2" "my-keypair" {
  name = "my-keypair"
}

resource "null_resource" "stdout_key_private" {
  provisioner "local-exec" {
    command = "echo ${openstack_compute_keypair_v2.my-keypair.private_key} > /home/$USER/.ssh/terraform_rsa"
    
  }
  
}
resource "null_resource" "stdout_key_public" {
  provisioner "local-exec" {
    command = "echo ${openstack_compute_keypair_v2.my-keypair.public_key} > /home/$USER/.ssh/terraform_rsa.pub"
    
  }
  
}