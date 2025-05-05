#!/bin/bash
[ -z "$DISPLAY" ] && export DISPLAY=:0
bash ~/dots/scripts/desktop/dwm-statusbar.sh &
while true; do
	xrdb -merge ~/.Xresources
	setxkbmap -layout us,ru -option grp:alt_shift_toggle
	dwm
done
