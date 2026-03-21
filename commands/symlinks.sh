#!/bin/zsh

set -euo pipefail

function symlink() {
  src="$1"
  dest="$2"

  if [ -e "$dest" ]; then
    if [ -L "$dest" ]; then
      return
    else
      echo "$dest already exists, renaming to $dest.old"
      backup="$dest.old"
      i=0
      while [ -e "$backup" ]; do
        i=$((i + 1))
        backup="$dest.old.$i"
      done
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
symlink "$DOTFILES/config/vscode.settings.json" "$vscode_path/settings.json"
unset vscode_path

# Karabiner
karabiner_path="$HOME/.config/karabiner"
mkdir -p "$karabiner_path"
symlink "$DOTFILES/config/karabiner.json" "$karabiner_path/karabiner.json"
unset karabiner_path

# llm
llm_dir="$HOME/Library/Application Support/io.datasette.llm"
mkdir -p "$llm_dir"
symlink "$DOTFILES/config/extra-openai-models.yaml" "$llm_dir/extra-openai-models.yaml"
unset llm_dir

# Kill apps
for app in "Visual Studio Code" "Karabiner-Elements"; do
	killall "${app}" &> /dev/null || true
done
unset app

echo "Done."
