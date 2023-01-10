#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

if [ "$SCRIPTPATH" == '.' ]
then
	SCRIPTPATH=$(dirname "$BASH_SOURCE")
fi

IPADDR=$1

sudo chown "$(whoami)" /etc/resolv.conf

sudo chmod u+w /etc/resolv.conf

sudo echo "nameserver $(echo $IPADDR | cut -d "." -f1-3).1" >> /etc/resolv.conf

sudo apt update
sudo apt -y install nginx
sudo apt -y install cron

server_list=""

ci=1

for i in $(grep 'Amaster' /etc/hosts | awk -F " " '{print $2}')
do
    server_list="${server_list}    server master-0${ci}:6443;\n"
	ci=$((ci+1))
done

ci=$((ci-1))

sudo echo "$(sudo sed "s/    server_template/$server_list/g" "$SCRIPTPATH/nginx.conf")" > /etc/nginx/nginx.conf
sudo nginx -c /etc/nginx/nginx.conf
sudo nginx -s reload

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod a+x kubectl

sudo mv kubectl /bin/kubectl

sudo mkdir -p "$HOME/.kube"

sudo cp "$SCRIPTPATH/configs/config" "$HOME/.kube/config"

sudo chmod a+r "$HOME/.kube/config"

sudo echo "$ci" > /etc/nginx/master_num
sudo echo "$SCRIPTPATH" > /etc/nginx/script_path

sudo cp "$SCRIPTPATH/update_masters.sh" /bin/update_masters.sh

sudo chmod a+x /bin/update_masters.sh

sudo chmod u+w /etc/cron.d
sudo echo "* * * * * root if ping -c 1 master-01; then sudo /etc/init.d/nginx reload; sudo echo \"*/3 * * * * root update_masters.sh\" > /etc/cron.d/watchmaster; sudo rm -f /etc/cron.d/connect; fi" > /etc/cron.d/connect

sudo echo "*/5 * * * * root if[ ! -z \"\$(sudo diff \"$SCRIPTPATH/configs/config\" \"$HOME/.kube/config\")\" ]; then sudo cp \"$SCRIPTPATH/configs/config\" \"$HOME/.kube/config\"; sudo chmod a+r \"$HOME/.kube/config\"; fi" > /etc/cron.d/kubeconfig # sudo rm -f /etc/cron.d/kubeconfig;

sudo chown root /etc/cron.d/connect
sudo chmod g-w /etc/cron.d/connect

sudo chown root /etc/cron.d/kubeconfig
sudo chmod g-w /etc/cron.d/kubeconfig