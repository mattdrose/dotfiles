#!/usr/bin/env bash

basedir="$HOME/dotfiles"
bindir="$HOME/bin"
repourl="git://github.com/mattdrose/dotfiles.git"

function symlink() {
  src="$1"
  dest="$2"

  if [ -e "$dest" ]; then
    if [ -L "$dest" ]; then
      # Already symlinked -- I'll assume correctly.
      return
    else
      # Rename files with a ".old" extension.
      echo "$dest already exists, renaming to $dest.old"
      backup="$dest.old"
      if [ -e "$backup" ]; then
        echo "Error: "$backup" already exists. Please delete or rename it."
        exit 1
      fi
      mv -v "$dest" "$backup"
    fi
  fi
  ln -sf "$src" "$dest"
}

if [ "$(uname -s)" = "Darwin" ]; then
  vscodepath="$HOME/Library/Application Support/Code/User"
else
  vscodepath="$HOME/.config/Code/User"
fi
mkdir -p "$vscodepath"
symlink "$basedir/.vscode.settings.json" "$vscodepath/settings.json"