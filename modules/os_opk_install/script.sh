#!bin/bash
echo -e "[[local|localrc]]
ADMIN_PASSWORD=StrongAdminSecret
DATABASE_PASSWORD=\$ADMIN_PASSWORD
RABBIT_PASSWORD=\$ADMIN_PASSWORD
SERVICE_PASSWORD=\$ADMIN_PASSWORD
HOST_IP=192.168.208.63" >> /opt/stack/devstack/local.conf
