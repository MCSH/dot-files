#!/bin/bash
# script to make connections to irc.irchighway.net go via DEV.
DEV=wlo1
HOST=185.126.202.243
GW=$(ip route list | sed "s/.* via \([0-9.]*\) dev $DEV.*/\1/;t;d"|head -1)
#route add -host $HOST gw $GW $DEV
ip route add $HOST dev $DEV via $GW
