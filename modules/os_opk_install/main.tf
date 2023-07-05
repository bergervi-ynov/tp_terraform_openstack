resource "null_resource" "ssh_connection_user" {
    connection {
        type    = "ssh"
        user    = var.ssh_user
        host    = var.ssh_host
        private_key = file(var.ssh_key)
        }
    # Install DevStack/OpenStack
    # Use a non root user
    provisioner "remote-exec" {
        inline = [ 
            # Following the DevStack Best Practice
            "sudo  useradd -s /bin/bash -d /opt/stack -m stack",
            "echo 'stack ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/stack",
            "sudo chmod +x /opt/stack",
            "sudo mkdir -p /opt/stack/.ssh",
            "sudo cp /home/${var.ssh_user}/.ssh/authorized_keys /opt/stack/.ssh/authorized_keys",
            "sudo chown stack:stack -R /opt/stack/.ssh"
         ]
    }

}

# resource "null_resource" "ssh_connection_stack"{
#     depends_on = [ null_resource.ssh_connection_user ]
#     connection {
#         type    = "ssh"
#         user    = "stack"
#         host    = var.ssh_host
#         private_key = file(var.ssh_key)
#         }
#     provisioner "file" {
#       source = "${path.module}/script.sh"
#       destination = "/tmp/script.sh"
#     }
#     provisioner "remote-exec" {
#         inline = [ 
#             "sudo apt install git -y",
#             "sudo git clone https://git.openstack.org/openstack-dev/devstack",
#             "sudo chmod 755 /tmp/script.sh && ./tmp/script.sh ",
#             "./devstack/stack.sh",
#             "sudo systemctl restart apache2"
#          ]
      
#     }

# }



