#!/bin/bash
LINE=""
while true; do
	LINE=$(acpi -b | grep -oP '[0-9]+(?=%)' | awk '{print "BAT:"$1"%"}' | head -1)
	LINE="$LINE, Help me"
	xsetroot -name "$LINE"
	sleep 1
done
