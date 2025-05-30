#!/bin/bash
xsetroot -name "Wait..."
while true; do
	BAT0=$(cat /sys/class/power_supply/BAT0/capacity >/dev/null)
	[ -z $BAT0 ] && BATTERY="INF" || BATTERY="$BAT0%"
	DATETIME=$(date '+%d.%m %H:%M')
	xsetroot -name "BAT=$BATTERY | $DATETIME"
	sleep 30
done
