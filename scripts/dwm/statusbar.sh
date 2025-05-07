#!/bin/bash

#WEATHER="Pending..."
#(
#while true; do
#	WEATHER=$(curl "https://wttr.in/?format=%t,%p,%w")
#	sleep 30
#done
#) &
#
#BATTERY="Pending..."
#(
#while true; do
#	BATTERY=$(acpi -b | grep -oP '[0-9]+(?=%)' | awk '{print "POWER: "$1"%"}' | head -1)
#	[ ! -z $BATTERY ] && BATTERY="POWER: INFINITE"
#	sleep 10
#done
#) &

DATETIME="Pending..."
(
while true; do
	DATETIME=$(date '+%Y-%m-%d %H:%M:%S')
	sleep 1
done
) &

# M A I N L O O P

while true; do
	LINE=""
	#LINE="$WEATHER | $BATTERY | HELP ME | $DATETIME"
	LINE="->$DATETIME<-"
	xsetroot -name "$LINE"
	sleep 1
done
