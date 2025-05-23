#!/bin/bash

set -x

echo $(dirname $(realpath $0))

echo "[desktop.sh] Symlink the sxwm config..."
mkdir -p ~/.config
rm $HOME/.config/sxwmrc
ln -s $(pwd)/sxwm/sxwmrc $HOME/.config/sxwmrc

echo "[desktop.sh] Symlink the picom config..."
mkdir -p ~/.config/picom
rm $HOME/.config/picom
ln -s $(pwd)/sxwm/picom.conf $HOME/.config/picom/picom.conf

echo "[desktop.sh] Symlink the .xinitrc & .Xresources..."
rm $HOME/.xinitrc
rm $HOME/.Xresources
ln -s $(pwd)/sxwm/xinitrc $HOME/.xinitrc
cp $(pwd)/sxwm/Xresources $HOME/.Xresources
