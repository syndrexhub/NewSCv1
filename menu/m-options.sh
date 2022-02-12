#!/bin/bash
#SSH-Menu

# Color
blue='\e[34m'
red='\e[31m'
green='\e[32m'
nc='\e[0m'
clear 
echo -e "\e[31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\E[0;100;31m                   • Options Menu •                     \E[0m"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e ""
echo -e "                 [\e[34m•1\e[0m]  Delete Xray Account"
echo -e "                 [\e[34m•2\e[0m]  Delete Vmess Account"
echo -e "                 [\e[34m•3\e[0m]  Delete Vless Account "
echo -e "                 [\e[34m•4\e[0m]  Delete Trojan Account"
echo -e ""
echo -e "                 [\e[34m•5\e[0m]  Renew Xray Account"
echo -e "                 [\e[34m•6\e[0m]  Renew Vmess Account"
echo -e "                 [\e[34m•7\e[0m]  Renew Vless Account"
echo -e "                 [\e[34m•8\e[0m]  Renew Trojan Account"
echo -e ""
echo -e "                 [\e[34m•9\e[0m]  Check Vmess Account"
echo -e "                 [\e[34m•10\e[0m] Check Vless Account"
echo -e "                 [\e[34m•11\e[0m] Check Trojan Account"
echo -e ""
echo -e "                 [\e[34m•12\e[0m] Port Xray Account"
echo -e "                 [\e[34m•13\e[0m] Port Vmess Account"
echo -e "                 [\e[34m•14\e[0m] Port Vless Account"
echo -e "                 [\e[34m•15\e[0m] Port Trojan Account"
echo -e ""
echo -e "                 [\e[34m•x\e[0m] Back To Menu <\e[31m<\e[32m<        "
echo -e ""
echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e ""
read -p "      Select From Options [1-15 or x] :  " menu
echo -e ""
case $menu in
1)
delxray
;;
2)
delvmess
;;
3)
delvless
;;
4)
deltrojan
;;
5)
renewxray
;;
6)
renewvmess
;;
7)
renewvless
;;
8)
renewtrojan
;;
9)
cekvmess
;;
10)
cekvless
;;
11)
cektrojan
;;
12)
port-xray
;;
13)
port-vmess
;;
14)
port-vless
;;
15)
port-trojan
;;
x)
menu
;;
*)
echo "Please Input An Correct Number !"
;;
esac
