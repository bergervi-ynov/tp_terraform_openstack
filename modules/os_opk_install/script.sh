#!bin/bash
echo -e "[[local|localrc]]
ADMIN_PASSWORD=StrongAdminSecret
DATABASE_PASSWORD=\$ADMIN_PASSWORD
RABBIT_PASSWORD=\$ADMIN_PASSWORD
SERVICE_PASSWORD=\$ADMIN_PASSWORD
HOST_IP=$(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')>> /opt/stack/devstack/local.conf
