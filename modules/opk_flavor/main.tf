resource "openstack_compute_flavor_v2" "ubuntu_flavor" {
    name= ubuntu_flavor
    ram = "1024"
    vcpus = "1"
    disk = "10"  
}