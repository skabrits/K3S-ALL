#!/bin/bash

/usr/local/bin/k3s-uninstall.sh &> /dev/null
/usr/local/bin/k3s-agent-uninstall.sh &> /dev/null

if [ $1 == "-lb" ]
then
    sudo chmod u+w /etc/cron.d
    sudo rm -f /etc/cron.d/connect
	sudo rm -f /etc/cron.d/watchmaster
    
    sudo rm -f /etc/cron.d/kubeconfig
	sudo nginx -s stop
fi