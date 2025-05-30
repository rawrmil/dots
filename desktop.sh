#!/bin/bash

set -x

echo $(dirname $(realpath $0))

cd ~/dots

echo "[desktop.sh] Symlink the config.h..."
ln -s $(pwd)/dwm/dwm/config.h $HOME/suckless/dwm/config.h

echo "[desktop.sh] Symlink the picom config..."
mkdir -p ~/.config/picom
rm $HOME/.config/picom/picom.conf
ln -s $(pwd)/dwm/picom.conf $HOME/.config/picom/picom.conf

echo "[desktop.sh] Symlink the .xinitrc & .Xresources..."
rm $HOME/.xinitrc
rm $HOME/.Xresources
ln -s $(pwd)/dwm/xinitrc $HOME/.xinitrc
cp $(pwd)/dwm/Xresources $HOME/.Xresources
