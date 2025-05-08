#!/bin/bash
set -x
set -e
cd ~/dots/scripts/dwm/
gcc -pthread -o statusbar statusbar.c -lX11
pkill -f ~/dots/scripts/dwm/statusbar
exec ~/dots/scripts/dwm/statusbar
