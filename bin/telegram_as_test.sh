#!/bin/sh
xhost +SI:localuser:test
#Just to get sudo access
sudo ls 
sudo -u test nohup /home/test/Telegram&
