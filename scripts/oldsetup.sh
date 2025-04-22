#!/bin/bash

#set -x

DOTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# A R G U M E N T S

if [ -z $1 ]; then
	echo "Usage: "
	echo "./setup.sh [-nosync/USER@IP:PORT]"
	exit 1
fi

if [ "$1" != "-nosync" ]; then
	ssh_string=$1
	ssh_user="${ssh_string%%@*}"
	remainder="${ssh_string#*@}"
	ssh_ip="${remainder%%:*}"
	ssh_port="${remainder#*:}"

	echo "User: $ssh_user"
	echo "IP: $ssh_ip"
	echo "Port: $ssh_port"

	echo "#!/bin/bash
	ssh_user=$ssh_user
	ssh_ip=$ssh_ip
	ssh_port=$ssh_port" \
	> ~/.syncdata
fi

# D E P E N D E N C I E S

# Default
rootfs="/"
zsh_chsh_path="/bin/zsh"

# Termux
if [ `echo $PREFIX | grep -o "com.termux"` ]; then
	rootfs="$TERMUX__ROOTFS"
	zsh_chsh_path="/zsh"
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

if [ "$1" != "-nosync" ]; then
	if ! hascmd "ssh"; then
		echo "[ERR] Don't have 'ssh' command for synchronisation"
		exit 1
	fi
	if ! hascmd "rsync"; then
		echo "[ERR] Don't have 'rsync' command for synchronisation"
		exit 1
	fi
fi

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
