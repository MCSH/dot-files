#!/bin/bash


systemctl stop gdm

modprobe -ar nvidia nvidia_drm nvidia_modeset nvidia_uvm

sleep 10

systemctl start gdm
