netsh advfirewall firewall add rule name= "Open Port 9153 K8S" dir=in action=allow protocol=TCP localport=9153
netsh advfirewall firewall add rule name= "Open Port 53 K8S" dir=in action=allow protocol=TCP localport=53
netsh advfirewall firewall add rule name= "Open Port 80 K8S" dir=in action=allow protocol=TCP localport=80
netsh advfirewall firewall add rule name= "Open Port 8080 K8S" dir=in action=allow protocol=TCP localport=8080
netsh advfirewall firewall add rule name= "Open Port 443 K8S" dir=in action=allow protocol=TCP localport=443
netsh advfirewall firewall add rule name= "Open Port 9090 K8S" dir=in action=allow protocol=TCP localport=9090
netsh advfirewall firewall add rule name= "Open Port 9099 K8S" dir=in action=allow protocol=TCP localport=9099
netsh advfirewall firewall add rule name= "Open Port 6443 K8S" dir=in action=allow protocol=TCP localport=6443
netsh advfirewall firewall add rule name= "Open Port 10250 K8S" dir=in action=allow protocol=TCP localport=10250
netsh advfirewall firewall add rule name= "Open Port 2379 K8S" dir=in action=allow protocol=TCP localport=2379
netsh advfirewall firewall add rule name= "Open Port 2380 K8S" dir=in action=allow protocol=TCP localport=2380
netsh advfirewall firewall add rule name= "Open Port 10259 K8S" dir=in action=allow protocol=TCP localport=10259
netsh advfirewall firewall add rule name= "Open Port 10257 K8S" dir=in action=allow protocol=TCP localport=10257

netsh advfirewall firewall add rule name= "Open Port 9153 K8S" dir=out action=allow protocol=TCP localport=9153
netsh advfirewall firewall add rule name= "Open Port 53 K8S" dir=out action=allow protocol=TCP localport=53
netsh advfirewall firewall add rule name= "Open Port 80 K8S" dir=out action=allow protocol=TCP localport=80
netsh advfirewall firewall add rule name= "Open Port 8080 K8S" dir=out action=allow protocol=TCP localport=8080
netsh advfirewall firewall add rule name= "Open Port 443 K8S" dir=out action=allow protocol=TCP localport=443
netsh advfirewall firewall add rule name= "Open Port 9090 K8S" dir=out action=allow protocol=TCP localport=9090
netsh advfirewall firewall add rule name= "Open Port 9099 K8S" dir=out action=allow protocol=TCP localport=9099
netsh advfirewall firewall add rule name= "Open Port 6443 K8S" dir=out action=allow protocol=TCP localport=6443
netsh advfirewall firewall add rule name= "Open Port 10250 K8S" dir=out action=allow protocol=TCP localport=10250
netsh advfirewall firewall add rule name= "Open Port 2379 K8S" dir=out action=allow protocol=TCP localport=2379
netsh advfirewall firewall add rule name= "Open Port 2380 K8S" dir=out action=allow protocol=TCP localport=2380
netsh advfirewall firewall add rule name= "Open Port 10259 K8S" dir=out action=allow protocol=TCP localport=10259
netsh advfirewall firewall add rule name= "Open Port 10257 K8S" dir=out action=allow protocol=TCP localport=10257

netsh advfirewall firewall add rule name= "Open Port 9153 K8S" dir=in action=allow protocol=UDP localport=9153
netsh advfirewall firewall add rule name= "Open Port 53 K8S" dir=in action=allow protocol=UDP localport=53
netsh advfirewall firewall add rule name= "Open Port 80 K8S" dir=in action=allow protocol=UDP localport=80
netsh advfirewall firewall add rule name= "Open Port 8080 K8S" dir=in action=allow protocol=UDP localport=8080
netsh advfirewall firewall add rule name= "Open Port 443 K8S" dir=in action=allow protocol=UDP localport=443
netsh advfirewall firewall add rule name= "Open Port 9090 K8S" dir=in action=allow protocol=UDP localport=9090
netsh advfirewall firewall add rule name= "Open Port 9099 K8S" dir=in action=allow protocol=UDP localport=9099
netsh advfirewall firewall add rule name= "Open Port 6443 K8S" dir=in action=allow protocol=UDP localport=6443
netsh advfirewall firewall add rule name= "Open Port 10250 K8S" dir=in action=allow protocol=UDP localport=10250
netsh advfirewall firewall add rule name= "Open Port 2379 K8S" dir=in action=allow protocol=UDP localport=2379
netsh advfirewall firewall add rule name= "Open Port 2380 K8S" dir=in action=allow protocol=UDP localport=2380
netsh advfirewall firewall add rule name= "Open Port 10259 K8S" dir=in action=allow protocol=UDP localport=10259
netsh advfirewall firewall add rule name= "Open Port 10257 K8S" dir=in action=allow protocol=UDP localport=10257

netsh advfirewall firewall add rule name= "Open Port 9153 K8S" dir=out action=allow protocol=UDP localport=9153
netsh advfirewall firewall add rule name= "Open Port 53 K8S" dir=out action=allow protocol=UDP localport=53
netsh advfirewall firewall add rule name= "Open Port 80 K8S" dir=out action=allow protocol=UDP localport=80
netsh advfirewall firewall add rule name= "Open Port 8080 K8S" dir=out action=allow protocol=UDP localport=8080
netsh advfirewall firewall add rule name= "Open Port 443 K8S" dir=out action=allow protocol=UDP localport=443
netsh advfirewall firewall add rule name= "Open Port 9090 K8S" dir=out action=allow protocol=UDP localport=9090
netsh advfirewall firewall add rule name= "Open Port 9099 K8S" dir=out action=allow protocol=UDP localport=9099
netsh advfirewall firewall add rule name= "Open Port 6443 K8S" dir=out action=allow protocol=UDP localport=6443
netsh advfirewall firewall add rule name= "Open Port 10250 K8S" dir=out action=allow protocol=UDP localport=10250
netsh advfirewall firewall add rule name= "Open Port 2379 K8S" dir=out action=allow protocol=UDP localport=2379
netsh advfirewall firewall add rule name= "Open Port 2380 K8S" dir=out action=allow protocol=UDP localport=2380
netsh advfirewall firewall add rule name= "Open Port 10259 K8S" dir=out action=allow protocol=UDP localport=10259
netsh advfirewall firewall add rule name= "Open Port 10257 K8S" dir=out action=allow protocol=UDP localport=

Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

wsl --install -d Ubuntu
wsl --update

wsl --set-default-version 2

$wsl_ip=$(wsl -- ip -o -4 -json addr list eth0 | ConvertFrom-Json | %{ $_.addr_info.local } | ?{ $_ })

netsh interface portproxy add v4tov4 listenport=9153 listenaddress=0.0.0.0 connectport=9153 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=53 listenaddress=0.0.0.0 connectport=53 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=80 listenaddress=0.0.0.0 connectport=80 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=8080 listenaddress=0.0.0.0 connectport=8080 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=443 listenaddress=0.0.0.0 connectport=443 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=9090 listenaddress=0.0.0.0 connectport=9090 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=9099 listenaddress=0.0.0.0 connectport=9099 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=6443 listenaddress=0.0.0.0 connectport=6443 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=10250 listenaddress=0.0.0.0 connectport=10250 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=2379 listenaddress=0.0.0.0 connectport=2379 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=2380 listenaddress=0.0.0.0 connectport=2380 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=10259 listenaddress=0.0.0.0 connectport=10259 connectaddress=$wsl_ip
netsh interface portproxy add v4tov4 listenport=10257 listenaddress=0.0.0.0 connectport=10257 connectaddress=$wsl_ip