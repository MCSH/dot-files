#!/bin/bash

ROT=$(xrandr --query --verbose | grep "^DP1" | cut -d ' ' -f 5)


if [ "$ROT" = "normal" ]; then
    xrandr --output DP1 --rotate left
elif [ "$ROT" = "left" ]; then
    xrandr --output DP1 --rotate right
else
    xrandr --output DP1 --rotate normal
fi
