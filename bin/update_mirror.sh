#!/bin/bash
#Update arch mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
cat /etc/pacman.d/mirrorlist.pacnew | sed 's/^.//' | rankmirrors -n 10 - | tee /etc/pacman.d/mirrorlist
