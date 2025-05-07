#!/bin/bash

WEATHER=
(
while true; do
	WEATHER=$(curl "https://wttr.in/?format=%t,%p,%w")
	sleep 30
done
) &

BATTERYTERY=
(
while true; do
	BATTERYTERY=$(acpi -b | grep -oP '[0-9]+(?=%)' | awk '{print "POWER: "$1"%"}' | head -1)
	[ ! -z $BATTERY ] && BATTERY="POWER: INFINITE"
	sleep 1
done
) &

DATETIME=
(
while true; do
	DATETIME=$(date '+%Y-%m-%d %H:%M:%S')
	sleep 1
done
) &

# M A I N L O O P

while true; do
	LINE=""
	LINE="$WEATHER | $BATTERY | HELP ME | $DATETIME"
	xsetroot -name "$LINE"
	sleep 1
done
