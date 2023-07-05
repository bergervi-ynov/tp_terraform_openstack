variable "ssh_host" { sensitive = true }
variable "ssh_user" { sensitive = true }
variable "ssh_key" { sensitive = true }

# module "os_opk_install" {
#   source = "./modules/os_opk_install"
#   ssh_host = var.ssh_host
#   ssh_key = var.ssh_key
#   ssh_user = var.ssh_user
# }

module "add_image_ubuntu" {
  source = "./modules/opk_image"
}

module "add_network" {
  source = "./modules/opk_network"
}

module "add_secgroup" {
  source = "./modules/opk_securitygroup"
}

module "add_keypair" {
  source = "./modules/opk_keypair"
}

module "add_flavor" {
  source = "./modules/opk_flavor"
}

module "ubuntu_1" {
  source               = "./modules/opk_compute"
  compute_name         = "ubuntu_web"
  compute_flavor_id    = module.add_flavor.ubuntu_flavor_object.id
  compute_image_id     = module.add_image_ubuntu.image.id
  compute_key_pair     = module.add_keypair.name
  compute_secgroup     = [module.add_secgroup.name]
  compute_network_name = module.add_network.name
}

module "ubuntu_2" {
  source               = "./modules/opk_compute"
  compute_name         = "ubuntu"
  compute_flavor_id    = module.add_flavor.ubuntu_flavor_object.id
  compute_image_id     = module.add_image_ubuntu.image.id
  compute_key_pair     = module.add_keypair.name
  compute_secgroup     = [module.add_secgroup.name]
  compute_network_name = module.add_network.name
}