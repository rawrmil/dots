#!/bin/bash
set -x
set -e
cd ~/dots/scripts/dwm/
gcc -pthread -o dwm-bar-update bar-update.c -lX11
exec ./dwm-bar-update
