#!/bin/bash

cd ~/dots/cht

if [ ! $? -eq 0 ]; then
	echo "[cht.sh] Can't cd into ~/dots/cht"
	exit
fi

tmp=$(mktemp)

fzf > "$tmp"

nvim `cat "$tmp"`

rm "$tmp"
