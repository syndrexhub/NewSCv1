#!/bin/bash
# My Telegram : https://t.me/kdevn9
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
rm -f setup.sh
clear
read -rp "Domain/Host : " -e domain
echo $domain > /etc/xray/domain
cp /etc/xray/domain /root/domain
cp /etc/xray/domain /etc/v2ray/domain
echo start
systemctl stop vmess-grpc
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
systemctl start vmess-grpc.service
echo Done
sleep 1.5
clear
neofetch --ascii_distro virus echo && echo "AutoScript By KDevN9" &&  echo "t.me/kdevn9"