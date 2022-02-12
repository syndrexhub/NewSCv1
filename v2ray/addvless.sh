#!/bin/bash
# Vless
# =======================

# Color
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"

ipadd=$(curl -s ipinfo.io/ip);

# Validate Your IP Address
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
IP=$( curl -s ipinfo.io/ip );
clear
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$(cat /etc/v2ray/domain)
fi
tls=$( cat /etc/v2ray/vless.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g' );
none=$( cat /etc/v2ray/vnone.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g');

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/vless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vless.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vnone.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/v2ray&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/v2ray&encryption=none&type=ws#${user}"
systemctl restart v2ray@vless
systemctl restart v2ray@vnone
clear
echo -e "Succesfully Create ${RED}V2Ray/VLess${NC} Accounts"
echo -e "Here Your Accounts Details :"
echo -e "\e[31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}IP Address${NC} : ${ipadd}"
echo -e "${GREEN}Remarks${NC} : ${user}"
echo -e "${GREEN}Port TLs${NC} : $tls"
echo -e "${GREEN}Port Non-TLs${NC} : $none"
echo -e "${GREEN}ID${NC} : ${uuid}"
echo -e "${GREEN}Encryption${NC} : none"
echo -e "${GREEN}Network${NC} : ws"
echo -e "${GREEN}Path${NC} : /v2ray"
echo -e "${GREEN}Expired Date${NC} : $exp"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}V2Ray/VLess TLs Configuration Link${NC} : ${vlesslink1}"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}V2Ray/VLess Non-TLs Configuration Link${NC} : ${vlesslink2}"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}Script By Zyanv${NC}"
echo -e "${GREEN}t.me/zyanv${NC}"
echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
read -p "Press Enter For Back To Menu CTRL+C To Cancel : "
menu
