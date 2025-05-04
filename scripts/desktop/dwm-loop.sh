#!/bin/bash

~/dots/scripts/desktop/dwm-statusbar.sh &
[ -z "$DISPLAY" ] && export DISPLAY=:0
while true; do
	dwm
	echo "dwm exited. Restarting..."
done
