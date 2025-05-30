#!/bin/bash
xsetroot -name "Wait..."
while true; do
	BATTERY=$()
	DATETIME=$(date '+%d.%m %H:%M')
	xsetroot -name "BAT=$BATTERY | $DATETIME"
	sleep 30
done
