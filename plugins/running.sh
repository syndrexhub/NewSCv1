#!/bin/bash
# Color
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"

#servicesshow
v2ray_service=$(systemctl status v2ray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_service=$(systemctl status v2ray@none | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_service=$(systemctl status trojan | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(/etc/init.d/nginx status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray-mini | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

if [[ $v2ray_service == "running" ]]; then 
   status_v2ray="${GREEN}Running ${NC}( No Eror )"
else
   status_v2ray="${RED}Not Running ${NC}( Eror )"
fi 

if [[ $vless_service == "running" ]]; then 
   status_vless="${GREEN}Running ${NC}( No Eror )"
else
   status_vless="${RED}Not Running ${NC}( Eror )"
fi 

if [[ $trojan_service == "running" ]]; then 
   status_trojan="${GREEN}Running ${NC}( No Eror )"
else
   status_trojan="${RED}Not Running ${NC}( Eror )"
fi 

if [[ $xray_service == "running" ]]; then 
   status_xray="${GREEN}Running ${NC}( No Eror )"
else
   status_xray="${RED}Not Running ${NC}( Eror )"
fi

if [[ $nginx_service == "running" ]]; then 
   status_nginx="${GREEN}Running ${NC}( No Eror )"
else
   status_nginx="${RED}Not Running ${NC}( Eror )"
fi 

echo -e "====================================="
echo -e "| Service Status Installed In VPS   |"
echo -e "====================================="
echo -e "
VMess       = $status_v2ray
VLess       = $status_vless
Trojan      = $status_trojan
Xray        = $status_xray
Nginx       = $status_nginx
"
echo -e "====================================="