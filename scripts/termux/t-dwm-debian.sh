#!/bin/bash

pkill dwm-loop
pkill app_process
termux-x11 :0 &
proot-distro login debian --shared-tmp -- bash -c "sudo bash ~/.xinitrc" &
