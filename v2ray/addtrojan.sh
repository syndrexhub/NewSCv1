#!/bin/bash
# Trojan
# ==================

# Color
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"

# Validate Your IP Address
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
IP=$( curl -s ipinfo.io/ip );
uuid=$(cat /etc/trojan/uuid.txt)
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
fi
tr=$(cat /etc/trojan/config.json | grep local_port | sed 's/local_//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/"//g' | sed 's/   //g' | sed 's/  //g')
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		user_EXISTS=$(grep -w $user /etc/trojan/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
domain=$(cat /etc/v2ray/domain)
read -p "Expired (days): " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan/akun.conf
systemctl restart trojan
trojanlink="trojan://${user}@${domain}:${tr}"
clear
echo -e "Succesfully Create ${RED}Trojan${NC} Accounts"
echo -e "Here Your Accounts Details :"
echo -e "\e[31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}IP Address${NC} : ${domain}"
echo -e "${GREEN}Remarks${NC} : ${user}"
echo -e "${GREEN}Port${NC} : ${tr}"
echo -e "${GREEN}Key${NC} : ${user}"
echo -e "${GREEN}Expired Date${NC} : $exp"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}Trojan Configuration Link${NC} : ${trojanlink}"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}Script By Zyanv${NC}"
echo -e "${GREEN}t.me/zyanv${NC}"
echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
read -p "Press Enter For Back To Menu CTRL+C To Cancel : "
menu
