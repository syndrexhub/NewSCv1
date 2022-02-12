#!/bin/bash
# Add Vmess
# ===================

# Color
RED="\e[1;31m"
GREEN="\e[0;64m"
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
tls=$(cat /etc/v2ray/config.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
none=$(cat /etc/v2ray/none.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
            read -rp "Bug Maxis : " Maxis
            read -rp "Masukan Bug : " bug   
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/config.json | wc -l)

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
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/v2ray/config.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/v2ray/none.json
cat>/etc/v2ray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${Maxis}.${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/v2ray",
      "type": "none",
      "host": "${bug}",
      "tls": "tls"
}
EOF
cat>/etc/v2ray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${Maxis}.${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/v2ray",
      "type": "none",
      "host": "${bug}",
      "tls": "none"
}
EOF

# Make File For Clash
cp /etc/pakyavpn/clash-nontls.yaml /home/vps/public_html/clash/${user}-nontls.yaml

# Input Username to clash configuration
sed -i "s/pakyavpn1/$user/g" /home/vps/public_html/clash/${user}-nontls.yaml
sed -i "s/pakyavpn2/$domain/g" /home/vps/public_html/clash/${user}-nontls.yaml
sed -i "s/pakyavpn3/$none/g" /home/vps/public_html/clash/${user}-nontls.yaml
sed -i "s/pakyavpn4/vmess/g" /home/vps/public_html/clash/${user}-nontls.yaml
sed -i "s/pakyavpn5/$uuid/g" /home/vps/public_html/clash/${user}-nontls.yaml
sed -i "s/pakyavpn6/64/g" /home/vps/public_html/clash/${user}-nontls.yaml
sed -i "s/pakyavpn7/auto/g" /home/vps/public_html/clash/${user}-nontls.yaml
sed -i "s/pakyavpn8/$domain/g" /home/vps/public_html/clash/${user}-nontls.yaml

# Make File For Clash ( TLS )
cp /etc/pakyavpn/clash-tls.yaml /home/vps/public_html/clash/${user}-tls.yaml

# Input Username to clash configuration
sed -i "s/pakyavpn1/$user/g" /home/vps/public_html/clash/${user}-tls.yaml
sed -i "s/pakyavpn2/$domain/g" /home/vps/public_html/clash/${user}-tls.yaml
sed -i "s/pakyavpn3/$tls/g" /home/vps/public_html/clash/${user}-tls.yaml
sed -i "s/pakyavpn4/vmess/g" /home/vps/public_html/clash/${user}-tls.yaml
sed -i "s/pakyavpn5/$uuid/g" /home/vps/public_html/clash/${user}-tls.yaml
sed -i "s/pakyavpn6/64/g" /home/vps/public_html/clash/${user}-tls.yaml
sed -i "s/pakyavpn7/auto/g" /home/vps/public_html/clash/${user}-tls.yaml
sed -i "s/pakyavpn8/$domain/g" /home/vps/public_html/clash/${user}-tls.yaml


vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmesslink1="vmess://$(base64 -w 0 /etc/v2ray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /etc/v2ray/$user-none.json)"
systemctl restart v2ray
systemctl restart v2ray@none
service cron restart
clear
echo -e "Succesfully Create ${RED}V2Ray/VMess${NC} Accounts"
echo -e "Here Your Accounts Details :"
echo -e "\e[31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}IP Address${NC} : ${ipadd}"
echo -e "${GREEN}Remarks${NC} : ${user}"
echo -e "${GREEN}Port TLs${NC} : ${tls}"
echo -e "${GREEN}Port Non-TLs${NC} : ${none}"
echo -e "${GREEN}ID${NC} : ${uuid}"
echo -e "${GREEN}AlterID${NC} : 0"
echo -e "${GREEN}Network${NC} : ws"
echo -e "${GREEN}Security${NC} : auto"
echo -e "${GREEN}Path${NC} : /v2ray"
echo -e "${GREEN}Expired Date${NC} : $exp"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}V2Ray/VMess TLs Configuration Link${NC} : ${vmesslink1}"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}V2Ray/VMess Non-TLs Configuration Link${NC} : ${vmesslink2}"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}Yaml Config Link${NC}"
echo -e "${GREEN}Link Yaml TLS${NC} : http://${IP}:81/clash/${user}-tls.yaml"
echo -e "${GREEN}Link Yaml Non-TLS${NC} : http://${IP}:81/clash/${user}-nontls.yaml"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "${GREEN}Script By Zyanv${NC}"
echo -e "${GREEN}t.me/zyanv${NC}"
echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
read -p "Press Enter For Back To Menu CTRL+C To Cancel : "
menu
