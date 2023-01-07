#!/bin/bash

IPADDR=$1
secret_token="$2"

sudo chown "$(whoami)" /etc/resolv.conf

sudo chmod u+w /etc/resolv.conf

sudo echo "nameserver $(echo $IPADDR | cut -d "." -f1-3).1" >> /etc/resolv.conf

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="777" INSTALL_K3S_VERSION="v1.21.14+k3s1" INSTALL_K3S_EXEC="--node-ip=${IPADDR} --flannel-backend=none --cluster-cidr=192.168.0.0/16 --disable-network-policy --disable=traefik" K3S_TOKEN="$secret_token" sh -s - server --server https://master-01:6443 --disable servicelb

# mkdir -p "~/.kube/"

# cp /vagrant/configs/config "~/.kube/config"