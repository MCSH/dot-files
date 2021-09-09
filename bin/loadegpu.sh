#!/bin/bash

modprobe -a nvidia nvidia_drm nvidia_modeset nvidia_uvm

systemctl restart gdm
