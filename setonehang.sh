#!/bin/bash
####################################################################
#  Change One ModeHang in /etc/mmdvmhost                           #
#                                                                  #
#  VE3RD                                               2024-12-27  #
####################################################################
#set -o errexit
#set -o pipefail

# Set value in $2 for Mode/Network
#if [ -z "$10" ]; then
#        exit
#else
	
echo -e "$1 - $2"

if [ "$1" == "211" ]; then
	Mode="D-Star"
fi

if [ "$1" == "212" ]; then
	Mode="DMR"
fi

if [ "$1" == "213" ]; then
	Mode="System Fusion"
fi

if [ "$1" == "214" ]; then
	Mode="NXDN"
fi

if [ "$1" == "215" ]; then
	Mode="P25"
fi

if [ "$1" == "216" ]; then
	Mode="M17"
fi

if [ "$1" == "221" ]; then
	Mode="D-Star Network"
fi

if [ "$1" == "222" ]; then
	Mode="DMR Network"
fi

if [ "$1" == "223" ]; then
	Mode="System Fusion Network"
fi

if [ "$1" == "224" ]; then
	Mode="NXDN Network"
fi

if [ "$1" == "225" ]; then
	Mode="P25 Network"
fi

if [ "$1" == "226" ]; then
	Mode="M17 Network"
fi
	echo "$1 - $2"
	sudo mount -o remount,rw /
	sudo sed -i '/^\[/h;G;/'"$Mode"'/s/\(ModeHang=\).*/\1'"$2"'/m;P;d' /etc/mmdvmhost
	sudo /usr/local/sbin/mmdvmhost.service restart  > /dev/null
	sudo mount -o remount,rw /
