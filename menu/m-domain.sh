#!/bin/bash
blue='\e[34m'
red='\e[31m'
green='\e[32m'
nc='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear 
echo -e "\e[31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\E[0;100;31m                    • Domain Menu •                                                                   \E[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e ""
echo -e "                 [\e[34m•1\e[0m]  Changedomain Host VPS"
echo -e "                 [\e[34m•2\e[0m]  Add ID Cloudflare"
echo -e "                 [\e[34m•3\e[0m]  Cloudflare AddOns"
echo -e "                 [\e[34m•4\e[0m]  Renew Certificate"
echo -e "                 [\e[34m•5\e[0m]  Pointing Bug"
echo -e ""
echo -e "                 [\e[34m•x\e[0m] Back To Menu <\e[31m<\e[32m<        "
echo -e ""
echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e ""
read -p "     Please Input Number  [1-6 or x] :  "  opt
echo -e ""
case $opt in
1) clear ; changedomain ;;
2) clear ; cff ;;
3) clear ; cfd ;;
4) clear ; cert ;;
5) clear ; cf ;;
x) clear ; menu ;;
*) echo "Please enter an correct number" ;;
esac


