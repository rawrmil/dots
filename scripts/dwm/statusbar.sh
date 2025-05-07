#!/bin/bash
while true; do
	# Battery
	LINE=""
	BAT=$(acpi -b | grep -oP '[0-9]+(?=%)' | awk '{print "BAT:"$1"%"}' | head -1)
	[ ! -z $BAT ] && LINE="$LINE$BAT "
	# Some cool text
	LINE="$LINE, Help me"
	# Date+time
	LINE="$LINE $(date)"
	xsetroot -name "$LINE"
	sleep 1
done
