#!/bin/bash

termux-x11 :0 &

proot-distro login debian --shared-tmp -- bash -c "export DISPLAY=:0; dwm" &
