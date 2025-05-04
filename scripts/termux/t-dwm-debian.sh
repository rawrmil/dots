#!/bin/bash

termux-x11 :0 &
sleep 2
proot-distro login debian --shared-tmp -- bash -c "sudo bash ~/.xinitrc" &
