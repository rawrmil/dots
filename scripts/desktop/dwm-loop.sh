#!/bin/bash
[ -z "$DISPLAY" ] && export DISPLAY=:0
bash ~/dots/scripts/desktop/dwm-statusbar.sh &
while true; do
	echo "$DISPLAY"
	dwm
done
