#!/bin/bash

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

# VS Code
if [ "$(uname -s)" = "Darwin" ]; then
  vscode_path="$HOME/Library/Application Support/Code/User"
else
  vscode_path="$HOME/.config/Code/User"
fi
mkdir -p "$vscode_path"
symlink "$DOTFILES/config/.vscode.settings.json" "$vscode_path/settings.json"
unset vscode_path

# Karabiner
karabiner_path="$HOME/.config/karabiner"
mkdir -p "$karabiner_path"
symlink "$DOTFILES/config/karabiner.json" "$karabiner_path/karabiner.json"
unset vscode_path

# Kill apps
for app in "Visual Studio Code" "Karabiner-Elements"; do
	killall "${app}" &> /dev/null
done
unset app

echo "Done."
