#!/bin/bash
set -e
set -x
cd ~/dots/scripts/dwm/
gcc -pthread -o bar-update.bin bar-update.c -lX11
exec -a RH_DWM_BAR_UPDATE ./bar-update.bin
