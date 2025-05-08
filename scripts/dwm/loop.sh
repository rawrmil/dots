#!/bin/bash
set -x
[ -z "$DISPLAY" ] && export DISPLAY=:0
[ -z "$XDG_RUNTIME_DIR" ] && export XDG_RUNTIME_DIR=/tmp
while true; do
	pkill rh-statusbar-run.sh
	bash ~/dots/scripts/dwm/rh-statusbar-run.sh &
	xrdb -merge ~/.Xresources
	setxkbmap -layout us,ru -option grp:alt_shift_toggle
	picom -b --config ~/dots/conf/desktop/picom.conf
	dwm
done
