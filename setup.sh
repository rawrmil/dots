#!/bin/bash

#set -x

DOTS_DIR="$HOME/dots"

# D E P E N D E N C I E S

# Default
rootfs="/"
zsh_chsh_path="/bin/zsh"

# Termux
if [ `echo $PREFIX | grep -o "com.termux"` ]; then
	rootfs="$TERMUX__ROOTFS"
	zsh_chsh_path="zsh"
	rm ~/.termux/termux.properties
	rm ~/.termux/colors.properties
	ln -s $DOTS_DIR/conf/termux/termux.properties $HOME/.termux/termux.properties
	ln -s $DOTS_DIR/conf/termux/colors.properties $HOME/.termux/colors.properties
	pkg install termux-api
fi

# U T I L S

hascmd() {
	if command -v "$1" 2>&1 >/dev/null; then
		return 0
	fi
	echo "[ERR] no '$1' command!"
	return 1
}

# P R O G R A M S

if hascmd "nvim"; then
	echo "[LOG] neovim setup..."
	rm ~/.config/nvim/init.vim
	mkdir -p ~/.config/nvim
	ln -s $DOTS_DIR/conf/init.vim ~/.config/nvim/init.vim
fi

if hascmd "tmux"; then
	echo "[LOG] tmux setup..."
	ln -s $DOTS_DIR/conf/tmux.conf ~/.tmux.conf
	rm ~/.tmux.conf
fi

if hascmd "git"; then
	echo "[LOG] git setup..."
	git config --global user.name "Ramil Khasanshin"
	git config --global user.email "khasanshin.ramil@list.ru"
fi

if hascmd "zsh"; then
	echo "[LOG] zsh setup..."
	rm ~/.zshrc
	ln -s $DOTS_DIR/conf/zshrc $HOME/.zshrc
	chsh -s $zsh_chsh_path
fi

if hascmd "gh"; then
	if gh auth status > /dev/null; then
		echo "[LOG] gh already authorized..."
	else
		echo "[LOG] gh login..."
		gh auth login
	fi
fi

hascmd "fzf"
