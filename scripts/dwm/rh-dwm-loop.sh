#!/bin/bash
set -x
[ -z "$DISPLAY" ] && export DISPLAY=:0
[ -z "$XDG_RUNTIME_DIR" ] && export XDG_RUNTIME_DIR=/tmp
while true; do
	pkill -f rh-dwm-bar-run.bin
	exec ~/dots/scripts/dwm/rh-dwm-bar-run.sh &
	xrdb -merge ~/.Xresources
	setxkbmap -layout us,ru -option grp:alt_shift_toggle
	picom -b --config ~/dots/conf/dwm/picom.conf
	dwm
done
