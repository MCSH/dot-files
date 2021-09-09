#!/bin/bash

export KEYBOARD=15
export MASTER=3

xinput list | grep float
if [ $? == 0 ]; then
    notify-send "Enabling Keyboard"
    xinput reattach $KEYBOARD $MASTER
else
    notify-send "Disabling Keyboard"
    xinput float $KEYBOARD
fi
