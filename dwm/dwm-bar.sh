#!/bin/bash
xsetroot -name "Wait..."
while true; do
	BATTERY=$(acpi -b | grep -P -o '[0-9]+(?=%)')
	DATETIME=$(date '+%d.%m %H:%M')
	xsetroot -name "BAT=$BATTERY | $DATETIME"
	sleep 30
done
