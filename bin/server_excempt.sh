#!/bin/bash
# script to make connections to irc.irchighway.net go via DEV.
DEV=wlp63s0
HOST=$1
if [ -z $HOST ] ; then
    HOST=64.141.32.241
fi
GW=$(ip route list | sed "s/.* via \([0-9.]*\) dev $DEV.*/\1/;t;d"|head -1)
echo $GW
#route add -host $HOST gw $GW $DEV
ip route add $HOST dev $DEV via $GW
