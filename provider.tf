terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}

provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "xMvLAtOwFyGnwVoT3V96mRZsxaMyxNE8HVQ4G8CJ"
  auth_url    = "http://${var.ssh_host}:5000"
}
