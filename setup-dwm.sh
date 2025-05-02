#!/bin/bash

cd ~
mkdir -p suckless
cd suckless

# Clone
[ ! -d ./dwm ] && git clone https://git.suckless.org/dwm
[ ! -d ./dmenu ] && git clone https://git.suckless.org/dmenu
[ ! -d ./st ] && git clone https://git.suckless.org/st

# Substitute configs
rm dwm/config.h
rm st/config.h
ln -s $HOME/dots/conf/suckless/dwm/config.h $HOME/suckless/dwm/config.h
ln -s $HOME/dots/conf/suckless/st/config.h $HOME/suckless/st/config.h

echo "Build it yourself and solve problems..."
