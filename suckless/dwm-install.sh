#!/bin/bash

set -e

# Install Dependencies
apt update
apt install -y build-essential libx11-dev libxft-dev libxinerama-dev

# DWM
git clone https://git.suckless.org/dwm
cd dwm
make clean install
cd ..

# DMENU
git clone https://git.suckless.org/dmenu
cd dmenu
make clean install
cd ..

# ST
git clone https://git.suckless.org/st
cd st
make clean install
cd ..

echo "dwm, dmenu, and st installed successfully."
