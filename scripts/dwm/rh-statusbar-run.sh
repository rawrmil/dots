#!/bin/bash
set -x
set -e
cd ~/dots/scripts/dwm/
gcc -pthread -o rh-statusbar-update statusbar-update.c -lX11
pkill rh-statusbar-update
exec ~/dots/scripts/dwm/rh-statusbar-update
