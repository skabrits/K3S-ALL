#!/bin/bash

IP_BASE="192.168.1."
IP_START=2
MASTER_NUM=1
WORKER_NUM=1

sudo echo "$IP_BASE$((IP_START)) ALoadBalancer" >> /etc/hosts
for i in `seq 1 $MASTER_NUM`
do
    sudo echo "$IP_BASE$((IP_START+i)) Amaster-0$((i))" >> /etc/hosts
done
for i in `seq 1 $WORKER_NUM`
do
    sudo echo "$IP_BASE$((IP_START+MASTER_NUM+i)) Aworker-0$((i))" >> /etc/hosts
done

sudo swapoff -a

# keeps the swaf off during reboot
(crontab -l 2>/dev/null; echo "@reboot /sbin/swapoff -a") | crontab - || true