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
#function convert()
 	#echo $(date +%X)
#        lt=$(date --date='TZ="UTC"' "$tm")
#	lt=$(date -d "$tm UTC")
#	lt=$(echo "$lt" |cut -d " " -f 4)
#	tm1=$(echo "$lt" | cut -d " " -f3 | cut -d ":" -f1)
#	tm2=$(echo "$lt" | cut -d " " -f3 | cut -d ":" -f2)
#	echo "$tm1:$tm2"
#fi
f1=$(ls -tr /var/log/pi-star/MMDVM* | tail -1)
list1=$(sudo sed -n '/received network end of voice transmission from/p' $f1 | sed 's/,//g' | tail -1)

call=$(echo "$list1" | cut -d " " -f14)
dur=$(echo "$list1" | cut -d " " -f18)
pl=$(echo "$list1" | cut -d " " -f20)
#tm=$(echo "$list1" | cut -d " " -f3 | cut -d "." -f1)
tm=$(echo "$list1" | cut -d " " -f3 )
#echo "$tm"
ltz=$(date +%Z)
ltimd=$(TZ=EST date --date='2024-12-29 15:14 UTC')
tm1=$(echo "$ltimd" | cut -d " " -f4)
tim2=$(echo "${tm1:0:5}")
echo "$tim2"

#lt=$(date -d "$tm UTC")

#convert
