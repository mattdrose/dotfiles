#!/usr/bin/env bash

if [ $SPIN ]; then
  sudo apt-get install -y rsync
	sudo chsh -s /bin/bash spin
fi

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;

	if type tmux >/dev/null 2>/dev/null; then
    tmux source-file ~/.tmux.conf
	fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then doIt;
elif [ $SPIN ]; then doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
