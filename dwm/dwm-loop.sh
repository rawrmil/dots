#!/bin/bash
set -x
[ -z "$DISPLAY" ] && export DISPLAY=:0
#[ -z "$XDG_RUNTIME_DIR" ] && export XDG_RUNTIME_DIR=/tmp
sudo mkdir -p /run/user/$(id -u)
sudo chown $USER:$USER /run/user/$(id -u)
export XDG_RUNTIME_DIR=/run/user/$(id -u)
while true; do
	xrdb -merge ~/.Xresources
	setxkbmap -layout us,ru -option grp:alt_shift_toggle
	picom -b --config ~/dots/dwm/picom.conf
	~/dots/dwm/dwm-bar.sh &
	dwm
done
