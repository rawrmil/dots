#!/bin/bash
[ -z "$DISPLAY" ] && export DISPLAY=:0
xrdb -merge ~/.Xresources
setxkbmap -layout us,ru -option grp:alt_shift_toggle
bash ~/dots/scripts/desktop/dwm-statusbar.sh &
while true; do
	dwm
done
