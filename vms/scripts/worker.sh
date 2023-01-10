#!/bin/bash

ip a show eth1 | grep "inet " | awk '{print $2}' | cut -d / -f1
IPADDR=$(ip a show eth1 | grep "inet " | awk '{print $2}' | cut -d / -f1)
while [ -z $IPADDR ] 
do
	IPADDR=$(ip a show eth1 | grep "inet " | awk '{print $2}' | cut -d / -f1)
	ip a show eth1 | grep "inet " | awk '{print $2}' | cut -d / -f1
	sleep 5
done

sudo chown "$(whoami)" /etc/resolv.conf

sudo chmod u+w /etc/resolv.conf

sudo echo "nameserver $(echo $IPADDR | cut -d "." -f1-3).1" >> /etc/resolv.conf

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="777" INSTALL_K3S_VERSION="v1.21.14+k3s1" INSTALL_K3S_EXEC="--node-ip=${IPADDR}" K3S_URL=https://LoadBalancer:6443 K3S_TOKEN=SECRET sh -

# mkdir -p "~/.kube/"

# cp /vagrant/configs/config "~/.kube/config"