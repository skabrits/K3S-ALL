#! /bin/bash

master_num=$(cat /etc/nginx/master_num)

real_master_num=$(kubectl get nodes | grep "master" | grep "" -c)

if [ $real_master_num -gt 0 ]
then
	if [ $master_num != $real_master_num ]
	then
		server_list=""
		
		for i in $(sudo kubectl get nodes | awk -F " " '{print $1}' | grep master)
		do
			server_list="${server_list}    server $i:6443;\n"
		done
		
		
		sudo echo "$(sudo sed "s/    server_template/$server_list/g" $(cat /etc/nginx/script_path)/nginx.conf)" > /etc/nginx/nginx.conf
		sudo nginx -c /etc/nginx/nginx.conf
		sudo nginx -s reload
		
		sudo echo "$real_master_num" > /etc/nginx/master_num
	fi
fi
	