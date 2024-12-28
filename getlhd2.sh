#!/bin/bash
#################################################
#  Get Last Heard Liost from MMDVMHost Log	#
#						#
#						#
#  VE3RD 			2020-05-03	#
#################################################
set -o errexit
set -o pipefail

######################################
#Start of Main Program
######################################

f1=$(ls -tr /var/log/pi-star/MMDVM* | tail -1)
list1=$(sudo sed -n '/received network end of voice transmission from/p' $f1 | sed 's/,//g' | tail -1)

call=$(echo "$list1" | cut -d " " -f14)
dur=$(echo "$list1" | cut -d " " -f18)
pl=$(echo "$list1" | cut -d " " -f20)
tm1=$(echo "$list1" | cut -d " " -f3 | cut -d ":" -f1)
tm2=$(echo "$list1" | cut -d " " -f3 | cut -d ":" -f2)

echo "$call|$dur|$pl|$tm1:$tm2"

