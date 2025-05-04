#!/bin/bash

termux-x11 :0 &

proot-distro login debian --shared-tmp -- bash -c "bash ~/.xinitrc; export DISPLAY=:0; dwm" &
