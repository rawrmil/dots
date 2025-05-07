#!/bin/bash
while true; do
	LINE=""
	# Weather
	curl wttr.in/moscow/?format="%t, %p, %w"
	# Battery
	BAT=$(acpi -b | grep -oP '[0-9]+(?=%)' | awk '{print "BAT:"$1"%"}' | head -1)
	[ ! -z $BAT ] && LINE="$LINE$BAT "
	# Some cool text
	LINE="$LINE | Help me"
	# Date+time
	LINE="$LINE | $(date '+%Y-%m-%d %H:%M:%S')"
	xsetroot -name "$LINE"
	sleep 1
done
