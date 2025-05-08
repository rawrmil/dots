#!/bin/bash
set -e
set -x
cd ~/dots/scripts/dwm/
gcc -pthread -o bar-update bar-update.c -lX11
exec ./bar-update
