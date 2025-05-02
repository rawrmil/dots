#!/bin/bash

# Exit if shit hits the fan
set -e
set -x

# Go to suckless
mkdir -p $HOME/suckless
cd $HOME/suckless

# Clone
[ ! -d ./dwm ] && git clone https://git.suckless.org/dwm
[ ! -d ./dmenu ] && git clone https://git.suckless.org/dmenu
[ ! -d ./st ] && git clone https://git.suckless.org/st

# Substitute configs
if [ ! -L dwm/config.h ]; then
	rm dwm/config.h
	ln -s $HOME/dots/conf/desktop/dwm/config.h $HOME/desktop/dwm/config.h
fi
if [ ! -L st/config.h ]; then
	rm st/config.h
	ln -s $HOME/dots/conf/desktop/st/config.h $HOME/desktop/st/config.h
fi

cd $HOME/suckless/dwm
sudo make install clean
cd $HOME/suckless/dmenu
sudo make install clean
cd $HOME/suckless/st
sudo make install clean
