#!/bin/bash
set -e
set -x
cd ~/dots/scripts/dwm/
gcc -pthread -o rh-dwm-bar-update.bin rh-dwm-bar-update.c -lX11
exec ./rh-dwm-bar-update.bin
