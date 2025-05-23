#!/bin/bash

# Exit if shit hits the fan
set -e
set -x

cd $(realpath $0)

echo "[desktop.sh] Symlink the sxwm config..."
mkdir -p ~/.config
ln -s ./dots/conf/sxwm/sxwmrc $HOME/.config/sxwmrc

echo "[desktop.sh] Symlink the picom config..."
ln -s ./dots/conf/sxwm/picom.conf $HOME/.config/sxwmrc

echo "[desktop.sh] Symlink the .xinitrc & .Xresources..."
ln -s ./sxwm/xinitrc $HOME/.xinitrc
sudo echo 'Xft.dpi: 180
Xft.antialias: true' | sudo tee $HOME/.Xresources


