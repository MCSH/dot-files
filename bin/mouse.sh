#!/bin/bash
# Script to keep mouse pointer moving so that, for example, Suspend to RAM timeout does not occur.

# The mouse pointer will move around its current position on the screen, i.e. around any position
# on the screen where you place the pointer. However, if you prefer it to move around the centre
# of the screen then change mousemove_relative to mousemove in the xdotool command below.

# Set LENGTH to 0 if you do not want the mouse pointer to actually move.
# Set LENGTH to 1 if you want the mouse pointer to move just a tiny fraction.
# Set LENGTH to e.g. 100 if you want to see more easily the mouse pointer move.
LENGTH=100
#
# Set DELAY to the desired number of seconds between each move of the mouse pointer.
DELAY=3
DELAY2=45
DELAY3=80
#
while true
do
    for ANGLE in 0 90 180 270
    do
        xdotool mousemove_relative --polar $ANGLE $LENGTH
        sleep 1
    done
    xdotool type --delay 500 "for while i++ in do print 1 * 123 - ok TODO "
    sleep $DELAY
    if (( RANDOM % 5 == 0 )); then 
        echo "Sleep!" ;
        sleep $(( RANDOM % $DELAY3 ));
    # else sleep $DELAY2 ;
    fi
done
