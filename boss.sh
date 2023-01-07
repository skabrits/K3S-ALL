#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if [ "$SCRIPTPATH" == '.' ]
then
	SCRIPTPATH=$(dirname "$BASH_SOURCE")
fi

# Getting Required IPs

IPADDR=$1
LB_IP=$2
secret_token="$3"

sudo chown "$(whoami)" /etc/resolv.conf

sudo chmod u+w /etc/resolv.conf

sudo echo "nameserver $(echo $IPADDR | cut -d "." -f1-3).1" >> /etc/resolv.conf

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="777" INSTALL_K3S_VERSION="v1.21.14+k3s1" K3S_TOKEN="$secret_token" INSTALL_K3S_EXEC="--node-ip=${IPADDR} --flannel-backend=none --cluster-cidr=192.168.0.0/16 --disable-network-policy --disable=traefik" sh -s - server --cluster-init --tls-san "$LB_IP" --disable servicelb

# Adding configs for dev kubectl (and token jic)
mkdir -p "$SCRIPTPATH/configs"

cp /var/lib/rancher/k3s/server/node-token "$SCRIPTPATH/configs/"
chmod a+r /etc/rancher/k3s/k3s.yaml

cp /etc/rancher/k3s/k3s.yaml "$SCRIPTPATH/configs/config"
chmod a+r "$SCRIPTPATH/configs/config"
sudo sed -i "s/127.0.0.1/$LB_IP/g" "$SCRIPTPATH/configs/config"


# argocd prereq

mkdir -p "~/.kube/"

cp "$SCRIPTPATH/configs/config" "~/.kube/config"

sudo kubectl create -f "https://raw.githubusercontent.com/projectcalico/calico/v3.24.4/manifests/calico.yaml"

# Deploying metal-lb
sudo kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.3/manifests/namespace.yaml
sudo kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.3/manifests/metallb.yaml

sudo kubectl create -f "$SCRIPTPATH/configmap.yaml"
