#!/bin/bash
# script to make connections to irc.irchighway.net go via DEV.
DEV=wlo1
HOST=164.138.18.103
GW=$(ip route list | sed "s/.* via \([0-9.]*\) dev $DEV.*/\1/;t;d"|head -1)
#route add -host $HOST gw $GW $DEV
ip route add $HOST dev $DEV via $GW
