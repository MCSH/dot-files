#!/bin/bash

MONITOR=HDMI-0

ROT=$(xrandr --query --verbose | grep "^$MONITOR" | cut -d ' ' -f 5)


if [ "$ROT" = "normal" ]; then
    xrandr --output $MONITOR --rotate left
elif [ "$ROT" = "left" ]; then
    xrandr --output $MONITOR --rotate right
else
    xrandr --output $MONITOR --rotate normal
fi
