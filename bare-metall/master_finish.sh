#!/bin/bash

for i in $(sudo kubectl get nodes | awk -F " " '{print $1}' | grep master)
do
    sudo kubectl taint nodes $i node-role.kubernetes.io/master=:NoSchedule
done
