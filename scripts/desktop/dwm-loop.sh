#!/bin/bash
set -x
[ -z "$DISPLAY" ] && export DISPLAY=:0
[ -z "$XDG_RUNTIME_DIR" ] && export XDG_RUNTIME_DIR=/tmp
bash ~/dots/scripts/desktop/dwm-statusbar.sh &
while true; do
	sudo xrdb -merge ~/.Xresources
	setxkbmap -layout us,ru -option grp:alt_shift_toggle
	dwm
done
