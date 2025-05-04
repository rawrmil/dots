#!/bin/bash
[ -z "$DISPLAY" ] && export DISPLAY=:0
bash ~/dots/scripts/desktop/dwm-statusbar.sh &
while true; do
	dwm
done
