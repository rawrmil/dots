#!/bin/sh

arp-scan --localnet 2>/dev/null | \
	grep -oP '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | \
	while read -r ip_addr; do
		for port in 22 8022; do
			if nc -z -w 1 "$ip_addr" "$port" 2>/dev/null; then
				echo "$ip_addr:$port"
			fi
		done
	done
