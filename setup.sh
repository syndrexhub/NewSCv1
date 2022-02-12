#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
Blink='\e[5m'
yell='\e[33m'
lgreen='\e[92m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
clear
echo ""  
echo -e "...........................................................$NC"
echo ''
echo -e "                Telegram:$NC $red@vzyanv01                $NC"
echo -e "                Scrript Version:$NC $red 1.0              $NC"
echo ''
echo ''
echo ''
echo ''
echo ''
echo -e "               Process Will be Start in 5 Sec              $NC"
echo -e "...........................................................$NC"
sleep 5
clear
echo -e "=============================================$NC"
echo -e "  Plese Put VPS Domain, If not Click Enter   $NC"
echo -e "=============================================$NC"
mkdir /etc/v2ray
mkdir /var/lib/premium-script;
read -p " Hostname / Domain: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /root/domain
echo "$host" >> /etc/v2ray/domain
echo "V1.0" >> /home/version
echo "@vpnshopee" >> /home/contact
clear
echo -e "=============================================$NC"
echo -e "            Please Wait a Minute             $NC"
echo -e "     Process Update & Upgrade in Processing  $NC"
echo -e "=============================================$NC"
sleep 2
apt-get update && apt-get upgrade -y && update-grub -y
clear
echo -e "=============================================$NC"
echo -e "       Process Update & Upgrade Done         $NC"
echo -e "=============================================$NC"
sleep 2
clear
echo -e "=============================================$NC"
echo -e "        Installing AutoScript zyanv01        $NC"
echo -e "=============================================$NC"
sleep 2
#install ssh ovpn
echo -e "=============================================$NC"
echo -e "              Install SSH OVPN               $NC"
echo -e "=============================================$NC"
sleep 2
wget https://raw.githubusercontent.com/zyanv01/NewSCv1/main/plugins/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
#install v2ray
echo -e "=============================================$NC"
echo -e "            Install V2RAY & TROJAN           $NC"
echo -e "=============================================$NC"
sleep 2
wget https://raw.githubusercontent.com/zyanv01/NewSCv1/main/v2ray/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#Instal Xray
echo -e "=============================================$NC"
echo -e "                Install XRAY                 $NC"
echo -e "=============================================$NC"
sleep 2
wget https://raw.githubusercontent.com/zyanv01/NewSCv1/main/xray/setup-xray.sh && chmod +x setup-xray.sh && screen -S setup-xray ./setup-xray.sh
# Download Template For Clash
echo -e "=============================================$NC"
echo -e "        Download Template For Clash          $NC"
echo -e "=============================================$NC"
sleep 2
mkdir -p /etc/pakyavpn/
wget -q -O /etc/pakyavpn/clash-nontls.yaml "https://raw.githubusercontent.com/zyanv01/NewSCv1/main/v2ray/template_vmess_nontls.yaml"
wget -q -O /etc/pakyavpn/clash-tls.yaml "https://raw.githubusercontent.com/zyanv01/NewSCv1/main/v2ray/template_vmess_tls.yaml"

rm -f /root/ssh-vpn.sh
rm -f /root/ins-vt.sh
rm -f /root/setup-xray.sh

cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://vpnshopee.xyz

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
history -c
clear
running
echo " "
echo -e "   =============================================$NC"
echo -e "         Installation has been completed!!      $NC"
echo -e "   =============================================$NC"
sleep 2
echo " "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - Vmess TLS          : 8443"  | tee -a log-install.txt
echo "   - Vmess None TLS     : 80"  | tee -a log-install.txt
echo "   - Vless TLS          : 8000"  | tee -a log-install.txt
echo "   - Vless None TLS     : 8080"  | tee -a log-install.txt
echo "   - Xray XTLS          : 443"  | tee -a log-install.txt
echo "   - Trojan-GFW         : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone           : Asia/Kuala_Lumpur (GMT +8)"  | tee -a log-install.txt
echo "   - Dflate             : [ON]"  | tee -a log-install.txt
echo "   - IPv6               : [OFF]"  | tee -a log-install.txt
echo "   - Auto-Reboot        : [ON]" | tee -a log-install.txt
echo "   - Auto-Remove-Expired: [ON]" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo ""
sleep 3
echo -e "$green   =============================================$NC"
echo -e "$green          SISTEM AKAN REBOOT SEBENTAR LAGI      $NC"
echo -e "$green   =============================================$NC"
echo ""
rm -f /root/setup.sh
rm -f /root/.bash_history
echo " Reboot in 15 Sec "
sleep 15
reboot
