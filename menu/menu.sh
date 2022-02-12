#!/bin/bash
blue='\e[34m'
red='\e[31m'
green='\e[32m'
nc='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear 
echo -e ""
echo -e "\e[31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "\E[0;100;31m               • AutoScript By Zynv01 •                                                               \E[0m"
echo -e "\e[0m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e ""
echo -e "                 [\e[34m•1\e[0m] Create Xray"
echo -e "                 [\e[34m•2\e[0m] Create Vmess"
echo -e "                 [\e[34m•3\e[0m] Create Vless"
echo -e "                 [\e[34m•4\e[0m] Create Trojan"
echo -e "                 [\e[34m•5\e[0m] Options menu"
echo -e "                 [\e[34m•6\e[0m] Domain Menu"
echo -e "                 [\e[34m•7\e[0m] Speedtest"
echo -e "                 [\e[34m•x\e[0m] \e[31mExit"
echo -e ""
echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e ""
read -p "      Select From Options [1-7 or x] :  " menu
echo -e ""
case $menu in
		1)
		clear
		addxray
		exit
		;;
		2)
		clear
		addvmess
		exit
		;;
		3)
		clear
		addvless
		exit
		;;
		4)
		clear
		addtrojan
		exit
		;;
		5)
		clear
		m-options
		exit
		;;
		6)
		clear
		m-domain
		exit
		;;
		7)
		clear
		speedtest
		exit		
		;;
		x)
		clear
		exit
		;;
	esac