#!/bin/bash

~/dots/scripts/desktop/dwm-statusbar.sh &

while true; do
	dwm
	echo "dwm exited. Restarting..."
done
