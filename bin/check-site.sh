#!/bin/bash

# Check to see when the website becomes online

while ! curl -s -m 10 $1 >> /dev/null ; do
    echo down ;
    sleep 10 ;
done ;
notify-done "Website is up" "$1 is back online"
