#!/bin/bash
#################################################
#  Get Last Heard Items from MMDVMHost Log	#
#						#
#						#
#  VE3RD 			2020-05-03	#
#################################################
set -o errexit
set -o pipefail

f1=$(ls -tr /var/log/pi-star/MMDVM* | tail -1)
list1=$(sudo sed -n '/received network end of voice transmission from/p' $f1 | sed 's/,//g' | tail -1)
#echo "$list1"
tg=$(echo "$list1" | cut -d " " -f17)
dur=$(echo "$list1" | cut -d " " -f18)
pl=$(echo "$list1" | cut -d " " -f20)
call=$(echo "$list1" | cut -d " " -f14)

list1=$(echo "${list1:3:19}")
#echo "$list1"

tm1=$(date -d "${list1:0:-1} UTC" '+%R')
echo "$tg|$dur|$pl|$tm1|$call"

