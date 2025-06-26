#!/bin/sh
set -x
[ -z "$DISPLAY" ] && export DISPLAY=:0
#[ -z "$XDG_RUNTIME_DIR" ] && export XDG_RUNTIME_DIR=/tmp
cleanup() {
    pkill -P $$ # Kill children
    wait
    exit 0
}
trap cleanup INT TERM EXIT
while true; do
	hsetroot -solid black
	xrdb -merge $HOME/.Xresources
	setxkbmap -layout us,ru -option grp:alt_shift_toggle
	picom -b --config ~/dots/dwm/picom.conf
	# Child processes
	flameshot &
	pkill dwm-bar.sh
	~/dots/dwm/dwm-bar.sh &
	# Start dwm
	dwm
	sleep 1
done
