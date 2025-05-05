#!/bin/bash
set -x
[ -z "$DISPLAY" ] && export DISPLAY=:0
[ -z "$XDG_RUNTIME_DIR" ] && export XDG_RUNTIME_DIR=/tmp
bash ~/dots/scripts/desktop/dwm-statusbar.sh &
while true; do
	xrdb -merge ~/.Xresources
	setxkbmap -layout us,ru -option grp:alt_shift_toggle
	picom -b --config ~/dots/conf/desktop/picom.conf
	dwm
	pkill picom
done
