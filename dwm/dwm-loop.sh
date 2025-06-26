#!/bin/bash
set -x
[ -z "$DISPLAY" ] && export DISPLAY=:0
#[ -z "$XDG_RUNTIME_DIR" ] && export XDG_RUNTIME_DIR=/tmp
while true; do
	flameshot &
	hsetroot -solid black
	xrdb -merge ~/.Xresources
	setxkbmap -layout us,ru -option grp:alt_shift_toggle
	picom -b --config ~/dots/dwm/picom.conf
	pkill dwm-bar.sh
	~/dots/dwm/dwm-bar.sh &
	dwm
	sleep 1
	exit 0
done
