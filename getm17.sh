############################################################
#  Get  M17 reflector from from /etc/m17gateway            #
#                                                          #
#                                                          #
#  VE3RD                                      2024-12-29   #
############################################################
#set -o errexit
#set -o pipefail
	m1=$(sed -nr "/^\[Network\]/ { :1 /^Startup[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/m17gateway)


echo "$m1"
